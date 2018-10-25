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
    $TestFile = "TestResults_PS$PSVersion`_$TimeStamp.xml"

    # Gather test results. Store them in a variable and file
    $CodeFiles = (Get-ChildItem $ENV:BHModulePath -Recurse -Include "*.psm1","*.ps1").FullName
    $TestResults = Invoke-Pester -Path $ProjectRoot\Tests -PassThru -CodeCoverage $CodeFiles -OutputFormat NUnitXml -OutputFile "$ProjectRoot\$TestFile"

    # TODO: Generate code coverage report (?)
    # $CoveragePercent = [math]::floor(100 - (($TestResults.CodeCoverage.NumberOfCommandsMissed / $TestResults.CodeCoverage.NumberOfCommandsAnalyzed) * 100))

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