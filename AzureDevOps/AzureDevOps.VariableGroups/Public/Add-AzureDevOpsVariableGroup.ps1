function Add-AzureDevOpsVariableGroup
{
    <#
    .SYNOPSIS
    Create a new variable group

    .DESCRIPTION
    Creates a new variable group using the currently added Azure DevOps account.

    .PARAMETER Name
    The name of the new variable group.

    .PARAMETER Description
    The description of the variable group.

    .PARAMETER Variables
    The variables contained in the variable group.

    .EXAMPLE
    $Variables = @();
    $Variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
    $Variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -Secret;
    Add-AzureDevOpsVariableGroup -Name "MyVariableGroup" -Value "MyValue" -Variables $Variables
    #>

    # TODO: Implement this
    
    $body = $group | ConvertTo-Json;
    return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups/$($GroupId)?api-version=4.1-preview.1" -Method Put -Body $body
}