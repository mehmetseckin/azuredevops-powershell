param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, BuildHelpers -Force
Install-Module Pester, PSScriptAnalyzer -SkipPublisherCheck -Force
Import-Module Psake, BuildHelpers, "$PSScriptRoot\Modules\Export-NUnitXml"

Set-BuildEnvironment -Force

Invoke-psake $PSScriptRoot\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )