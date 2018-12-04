param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

# Install PSDepend
Install-Module PSDepend -Scope CurrentUser -Force;

# Install and import dependencies
Invoke-PSDepend -Install -Import -Force -Verbose;
Import-Module "$PSScriptRoot\Modules\Export-NUnitXml" -Force;

Set-BuildEnvironment  -GitPath "git" -Force

Invoke-psake $PSScriptRoot\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )