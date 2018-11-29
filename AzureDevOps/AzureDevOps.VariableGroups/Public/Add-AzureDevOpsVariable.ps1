function Add-AzureDevOpsVariable
{
    <#
    .SYNOPSIS
    Add or update a variable to a specified variable group

    .DESCRIPTION
    Adds or updates a variable in the specified variable group

    .PARAMETER GroupId
    The ID of the variable group to add/update the variable in.

    .PARAMETER Name
    The variable name

    .PARAMETER Value
    The value for the variable

    .PARAMETER IsSecret
    The IsSecret flag for the variable.

    .EXAMPLE
    Add-AzureDevOpsVariable -GroupId "2" -Name "MyVar" -Value "MyValue"
    #>
    param
    (
       [string]$GroupId = "",
       [string]$Name = "",
       [string]$Value = "",
       [string]$IsSecret = "false"
    )

    $group = Get-AzureDevOpsVariableGroup -GroupId $GroupId;
    if(Get-Member -InputObject $group.variables -Name $Name -MemberType NoteProperty)
    {
        $group.variables."$Name".value = $Value
    }
    else
    {
        $valueObject = [PSCustomObject]@{
            value = $Value
            isSecret = $IsSecret
        };

        Add-Member -InputObject $group.variables -MemberType NoteProperty -Name $Name -Value $valueObject
    }

    $body = $group | ConvertTo-Json;
    return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups/$($GroupId)?api-version=4.1-preview.1" -Method Put -Body $body
}