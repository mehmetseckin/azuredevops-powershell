# PSake makes variables declared here available in other scriptblocks
Properties {

    $ModuleName = "AzureDevOps";

    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if(-not $ProjectRoot)
    {
        $ProjectRoot = Resolve-Path "$PSScriptRoot\.."
    }

    $DocumentationPath = "$ProjectRoot\Docs\";

    $Timestamp = Get-Date -UFormat "%Y%m%d-%H%M%S"
    $PSVersion = $PSVersionTable.PSVersion.Major
    $OutDir = "$ProjectRoot\Build\Output"
    New-Item -Type Directory -Path $OutDir -Force -ErrorAction SilentlyContinue;
}

Task Default -Depends Build, Test, Analyze

Task Init {
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
}

Task Build -Depends Init {
    # Load the module, read the exported functions, update the psd1 FunctionsToExport
    Set-ModuleFunctions -Name "$ProjectRoot\$ModuleName"
    Set-ModuleAliases -Name "$ProjectRoot\$ModuleName"
}

Task Analyze -Depends Build {
    
    $ModuleScriptAnalyzerResultsFile = "$OutDir\ModuleScriptAnalyzerResults_PS$PSVersion`_$TimeStamp.xml"
    $ExamplesScriptAnalyzerResultsFile = "$OutDir\ExamplesScriptAnalyzerResults_PS$PSVersion`_$TimeStamp.xml"

    $ScriptAnalyzerRules = Get-ScriptAnalyzerRule -Severity Warning
    $ExcludedRules = @('PSUseShouldProcessForStateChangingFunctions')
    $ModuleScriptAnalyzerResult = Invoke-ScriptAnalyzer -Path "$ProjectRoot\$ModuleName" -Recurse -IncludeRule $ScriptAnalyzerRules -ExcludeRule $ExcludedRules;
    If ( $ModuleScriptAnalyzerResult ) {  
        $ModuleScriptAnalyzerResultString = $ModuleScriptAnalyzerResult | Out-String
        Write-Warning $ModuleScriptAnalyzerResultString
    }

    Export-NUnitXml -ScriptAnalyzerResult $ModuleScriptAnalyzerResult -Path $ModuleScriptAnalyzerResultsFile;

    $ExamplesScriptAnalyzerResult = Invoke-ScriptAnalyzer -Path "$ProjectRoot\Examples" -Recurse -IncludeRule $ScriptAnalyzerRules -ExcludeRule $ExcludedRules;
    If ( $ExamplesScriptAnalyzerResult ) {  
        $ExamplesScriptAnalyzerResultString = $ExamplesScriptAnalyzerResult | Out-String
        Write-Warning $ExamplesScriptAnalyzerResultString
    }

    Export-NUnitXml -ScriptAnalyzerResult $ExamplesScriptAnalyzerResult -Path $ExamplesScriptAnalyzerResultsFile;
}

Task Test -Depends Build  {
    "`n`tTesting with PowerShell $PSVersion"

    $TestResultsFile = "$OutDir\TestResults_PS$PSVersion`_$TimeStamp.xml"
    $CodeCoverageFile = "$OutDir\CodeCoverageReport_PS$PSVersion`_$TimeStamp.xml"

    # Gather test results. Store them in a variable and file
    $CodeFiles = (Get-ChildItem $ENV:BHModulePath -Recurse -Include "*.psm1","*.ps1").FullName
    $TestResults = Invoke-Pester `
        -Path "$ProjectRoot\Tests" `
        -OutputFormat NUnitXml `
        -OutputFile $TestResultsFile `
        -CodeCoverage $CodeFiles `
        -CodeCoverageOutputFile $CodeCoverageFile `
        -CodeCoverageOutputFileFormat JaCoCo `
        -PassThru;

    if($TestResults.FailedCount -gt 0)
    {
        Write-Error "Failed '$($TestResults.FailedCount)' tests, build failed"
    }
    "`n"
}


Task GenerateDocs {

    Import-Module "$ProjectRoot\$ModuleName" -Scope Global -Force;
    New-MarkdownHelp -Module $ModuleName -OutputFolder $DocumentationPath -Force;
    Remove-Module "$ModuleName";
}

Task IndexDocs -Depends GenerateDocs  {


    function Get-ModuleIndexHeader
    {
        param
        (
            [Parameter(Mandatory=$true)]
            [PSModuleInfo]$ModuleInfo,
            [Parameter(Mandatory=$false)]
            [int]$Depth = 0
        )
        
        $hashes = "#" * ($Depth + 1);
        $Lines = @();
        $Lines += "$hashes [$($ModuleInfo.Name)](./$($ModuleInfo.Name).md) ";
        
        if($Depth -eq 0) 
        {
            $Lines += "$($ModuleInfo.Description) - ``version $($ModuleInfo.Version)``";
            $Lines += "";
            $Lines += "---";
        }
        
        $Lines += "";

        return $Lines;
    }

    function Get-ExportedCommandsIndex
    {
        param
        (
            [Parameter(Mandatory=$true)]
            [PSModuleInfo]$ModuleInfo,
            [Parameter(Mandatory=$false)]
            [int]$Depth = 0
        )
        
        $hashes = "#" * ($Depth + 2);
        $Lines = @();
        $Lines += "$hashes Commands"
        $Lines += ""

        $Commands = $ModuleInfo.ExportedCommands.Values | Where-Object {$_.CommandType -eq "Function"};
        foreach ($Command in $Commands) {
            $CommandName = $Command.Name;
            $Lines += "- [$CommandName](./$CommandName.md)"
        }
        $Lines += "";

        return $Lines;
    }

    function Write-ModuleIndex
    {
        param
        (
            [Parameter(Mandatory=$true)]
            [PSModuleInfo]$ModuleInfo,
            [Parameter(Mandatory=$false)]
            [string]$OutputFolder = ".",
            [Parameter(Mandatory=$false)]
            [int]$Depth = 0
        )

        $IndexFileName = "$($ModuleInfo.Name).md";
        $Lines = @();
        $Lines += Get-ModuleIndexHeader -ModuleInfo $ModuleInfo -Depth $Depth;
        if($ModuleInfo.NestedModules.Count -gt 0) 
        {
            foreach ($nestedModuleInfo in $ModuleInfo.NestedModules) {
                $Lines += Write-ModuleIndex -ModuleInfo $nestedModuleInfo -OutputFolder $OutputFolder -Depth ($Depth + 1)
            }
        }
        else {
            $Lines += Get-ExportedCommandsIndex -ModuleInfo $nestedModuleInfo -Depth $Depth;
        }

        $Lines -join [Environment]::NewLine | Out-File "$OutputFolder\$IndexFileName" -Force;
        return $Lines;
    }
    
    Import-Module "$ProjectRoot\$ModuleName" -Force;
    $ModuleInfo = Get-Module -Name $ModuleName;
    Write-ModuleIndex -ModuleInfo $ModuleInfo -OutputFolder $DocumentationPath;
}

Task Docs -Depends IndexDocs {}