# PSake makes variables declared here available in other scriptblocks
Properties {

    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if(-not $ProjectRoot)
    {
        $ProjectRoot = Resolve-Path "$PSScriptRoot\.."
    }
}

Task Default -Depends Build

Task Init {
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
}

Task Test -Depends Init  {
    "`n`tTesting with PowerShell $PSVersion"

    $Timestamp = Get-Date -UFormat "%Y%m%d-%H%M%S"
    $PSVersion = $PSVersionTable.PSVersion.Major
    $OutDir = "$ProjectRoot\Build\Output"
    New-Item -Type Directory -Path $OutDir -Force -ErrorAction SilentlyContinue;
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
}