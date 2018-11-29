$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName

Set-Alias -Name Connect-AzureDevOpsAccount -Value Add-AzureDevOpsAccount;
Set-Alias -Name Login-AzureDevOpsAccount -Value Add-AzureDevOpsAccount;

Export-ModuleMember -Alias Connect-AzureDevOpsAccount;
Export-ModuleMember -Alias Login-AzureDevOpsAccount;