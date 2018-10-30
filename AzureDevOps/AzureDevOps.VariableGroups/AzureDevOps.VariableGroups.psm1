. "$PSScriptRoot\Public\Add-AzureDevOpsVariableToVariableGroup.ps1";
. "$PSScriptRoot\Public\Get-AzureDevOpsVariableGroup.ps1";
. "$PSScriptRoot\Public\Copy-AzureDevOpsVariableGroup.ps1";

Export-ModuleMember -Function Add-AzureDevOpsVariableToVariableGroup;
Export-ModuleMember -Function Get-AzureDevOpsVariableGroup;
Export-ModuleMember -Function Copy-AzureDevOpsVariableGroup;