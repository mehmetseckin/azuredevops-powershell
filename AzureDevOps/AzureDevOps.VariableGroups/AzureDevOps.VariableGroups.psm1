. "$PSScriptRoot\Public\Add-AzureDevOpsVariable.ps1";
. "$PSScriptRoot\Public\Get-AzureDevOpsVariableGroup.ps1";
. "$PSScriptRoot\Public\Copy-AzureDevOpsVariableGroup.ps1";
. "$PSScriptRoot\Public\New-AzureDevOpsVariable.ps1";

Export-ModuleMember -Function Add-AzureDevOpsVariable;
Export-ModuleMember -Function Get-AzureDevOpsVariableGroup;
Export-ModuleMember -Function Copy-AzureDevOpsVariableGroup;
Export-ModuleMember -Function New-AzureDevOpsVariable;