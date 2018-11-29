function Add-AzureDevOpsVariableGroup
{
    <#
    .SYNOPSIS
    Create a new variable group

    .DESCRIPTION
    Creates a new variable group using the currently added Azure DevOps account.

    .PARAMETER Group
    The variable group object.

    .EXAMPLE
    $variables = @();
    $variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
    $variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -IsSecret $true;
    $group = New-AzureDevOpsVariableGroup -Name "MyGroup" -Description "My Awesome Group" -Variables $variables;
    Add-AzureDevOpsVariableGroup -Group $group
    #>

    param
    (
        [PSCustomObject]$Group
    )

    $body = $group | ConvertTo-Json;
    return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups?api-version=4.1-preview.1" -Method Post -Body $body
}