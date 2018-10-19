. "$PSScriptRoot\Account\Public\Add-AzureDevOpsAccount.ps1";

Set-Alias -Name Connect-AzureDevOpsAccount -Value Add-AzureDevOpsAccount;
Set-Alias -Name Login-AzureDevOpsAccount -Value Add-AzureDevOpsAccount;

Export-ModuleMember -Function Add-AzureDevOpsAccount;
Export-ModuleMember -Alias Connect-AzureDevOpsAccount;
Export-ModuleMember -Alias Login-AzureDevOpsAccount;
