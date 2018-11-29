function Add-AzureDevOpsVariable
{
    <#
    .SYNOPSIS
    Add or update a variable to a specified variable group

    .DESCRIPTION
    Adds or updates a variable in the specified variable group

    .PARAMETER GroupId
    The ID of the variable group to add/update the variable in.

    .PARAMETER Variable
    The variable object to add

    .EXAMPLE
    $myVariable = New-AzureDevOpsVariable -Name "MyVar" -Value "MyValue";
    Add-AzureDevOpsVariable -GroupId "2" -Variable $myVariable;
    #>
    param
    (
       [string]$GroupId = "",
       [string]$Variable = ""
    )

    $group = Get-AzureDevOpsVariableGroup -GroupId $GroupId;
    if(Get-Member -InputObject $group.variables -Name $Variable.Name -MemberType NoteProperty)
    {
        $group.variables."$($Variable.Name)" = $Variable.Value;
    }
    else
    {
        Add-Member -InputObject $group.variables -MemberType NoteProperty -Name $Variable.Name -Value $Variable.Value;
    }

    $body = $group | ConvertTo-Json;
    return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups/$($GroupId)?api-version=4.1-preview.1" -Method Put -Body $body
}