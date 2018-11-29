param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

$dependencies = @("Psake", "BuildHelpers", "Pester", "PSScriptAnalyzer", "platyPS", "$PSScriptRoot\Modules\Export-NUnitXml");
foreach ($moduleName in $dependencies)
{
    if(-not (Get-Module -Name $moduleName -ListAvailable))
    {
        Write-Verbose "Installing $moduleName";
        Install-Module $moduleName -Scope CurrentUser -SkipPublisherCheck -Force;
    }

    Write-Verbose "Importing $moduleName";
    Import-Module $moduleName -Force;
}

Set-BuildEnvironment  -GitPath "git" -Force

Invoke-psake $PSScriptRoot\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )