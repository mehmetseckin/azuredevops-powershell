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

Task Default -Depends Build

Task Init {
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
}

Task Analyze -Depends Init {
    
    $ModuleScriptAnalyzerResultsFile = "$OutDir\ModuleScriptAnalyzerResults_PS$PSVersion`_$TimeStamp.xml"
    $ExamplesScriptAnalyzerResultsFile = "$OutDir\ExamplesScriptAnalyzerResults_PS$PSVersion`_$TimeStamp.xml"

    $ScriptAnalyzerRules = Get-ScriptAnalyzerRule -Severity Warning
    $ModuleScriptAnalyzerResult = Invoke-ScriptAnalyzer -Path "$ProjectRoot\$ModuleName" -Recurse -IncludeRule $ScriptAnalyzerRules;
    If ( $ModuleScriptAnalyzerResult ) {  
        $ModuleScriptAnalyzerResultString = $ModuleScriptAnalyzerResult | Out-String
        Write-Warning $ModuleScriptAnalyzerResultString
    }

    Export-NUnitXml -ScriptAnalyzerResult $ModuleScriptAnalyzerResult -Path $ModuleScriptAnalyzerResultsFile;

    $ExamplesScriptAnalyzerResult = Invoke-ScriptAnalyzer -Path "$ProjectRoot\Examples" -Recurse -IncludeRule $ScriptAnalyzerRules;
    If ( $ExamplesScriptAnalyzerResult ) {  
        $ExamplesScriptAnalyzerResultString = $ExamplesScriptAnalyzerResult | Out-String
        Write-Warning $ExamplesScriptAnalyzerResultString
    }

    Export-NUnitXml -ScriptAnalyzerResult $ExamplesScriptAnalyzerResult -Path $ExamplesScriptAnalyzerResultsFile;
}

Task Test -Depends Analyze  {
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

Task Build -Depends Test {
    # Load the module, read the exported functions, update the psd1 FunctionsToExport
    Set-ModuleFunctions
    Set-ModuleAliases
}

Task GenerateDocs {

    Import-Module "$ProjectRoot\$ModuleName" -Scope Global -Force;
    New-MarkdownHelp -Module $ModuleName -OutputFolder $DocumentationPath -Force;
    Remove-Module "$ModuleName";
}

Task IndexDocs -Depends GenerateDocs  {

    $IndexFileName = "Index.md";
    $DocumentedCommands = (Get-ChildItem "$DocumentationPath\*.md" -Exclude $IndexFileName).BaseName;
    $IndexLines = @();
    $IndexLines += "# AzureDevOps Documentation";
    $IndexLines += "";
    foreach ($CommandName in $DocumentedCommands) {
        $IndexLines += "- [$CommandName](./$CommandName.md)"
    }
    $IndexLines -join [Environment]::NewLine | Out-File "$DocumentationPath\$IndexFileName" -Force;
}

Task Docs -Depends IndexDocs {}