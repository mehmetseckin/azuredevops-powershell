. "$PSScriptRoot\Private\Install-AzureDevOpsPackage.ps1";
. "$PSScriptRoot\Public\Install-AzureDevOpsNuGetPackage.ps1";
. "$PSScriptRoot\Public\Install-AzureDevOpsNpmPackage.ps1";

Export-ModuleMember -Function Install-AzureDevOpsNuGetPackage;
Export-ModuleMember -Function Install-AzureDevOpsNpmPackage;