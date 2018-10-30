function Get-AzureDevOpsVariableGroup
{
    <#
    .SYNOPSIS
    Retrieve a variable group or a set of variable groups.

    .DESCRIPTION
    Retrieves a variable group by its ID or a set of variable groups based on a search string.

    .PARAMETER GroupId
    The variable group ID. If this parameter is specified. the variable group with the specified ID will be retrieved.

    .PARAMETER SearchString
    The search string. If this parameter is specified, the variable groups whose names start with the specified search string will be retrieved.

    .EXAMPLE
    Get-AzureDevOpsVariableGroup -GroupId "2"

    Gets the variable group with ID: "2".

    .EXAMPLE
    Get-AzureDevOpsVariableGroups -SearchString "contoso"

    Gets variable groups which have names starting with "contoso".
    #>
    [CmdletBinding(DefaultParameterSetName = 'GroupId')]
    param
    (
       [Parameter(ParameterSetName='GroupId')]
       [string]$GroupId = "",

       [Parameter(ParameterSetName='SearchString')]
       [string]$SearchString = ""
    )

    if($PSCmdlet.ParameterSetName -eq 'GroupId')
    {
        return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups/$($GroupId)?api-version=4.1-preview.1" -Method Get;
    }
    else
    {
        if($SearchString)
        {
            $PartialUri = "/distributedtask/variablegroups/?groupName=$SearchString*&api-version=4.1-preview.1";
        }
        else
        {
            $PartialUri = "/distributedtask/variablegroups/?api-version=4.1-preview.1";
        }

        return Invoke-AzureDevOpsRestMethod -PartialUri $PartialUri -Method Get;
    }
}