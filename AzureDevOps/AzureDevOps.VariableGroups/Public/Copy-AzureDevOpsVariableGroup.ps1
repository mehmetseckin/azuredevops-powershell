function Copy-AzureDevOpsVariableGroup
{
    <#
    .SYNOPSIS
    Copy a variable group by ID

    .DESCRIPTION
    Creates a copy of the specified variable group

    .PARAMETER GroupId
    The variable group ID to copy

    .PARAMETER GroupName
    The source variable group name.

    .PARAMETER NewGroupName
    The name for the newly created variable group. This will default to the source name with a (Copy) suffix.

    .EXAMPLE
    Copy-AzureDevOpsVariableGroup -GroupId "2"
    #>
    param
    (
        [Parameter(
            ParameterSetName='GroupId',
            Mandatory=$true
        )]
        [string]$GroupId,

        [Parameter(
            ParameterSetName='GroupName',
            Mandatory=$true
        )]
        [string]$GroupName,
        [string]$NewGroupName
    )

    if($GroupId)
    {
        $group = Get-AzureDevOpsVariableGroup -GroupId $GroupId;
    }
    elseif($GroupName)
    {
        $group = (Get-AzureDevOpsVariableGroup -SearchString $GroupName)[0];
    }

    if(-not $NewGroupName)
    {
        $NewGroupName = "$($group.name) (Copy)";
    }

    $newGroup = [PSCustomObject]@{
        name = $NewGroupName
        description = $group.description
        providerData = $group.providerData
        type = $group.type
        variables = $group.variables
    };

    $body = $newGroup | ConvertTo-Json;
    return Invoke-AzureDevOpsRestMethod -PartialUri "/distributedtask/variablegroups?api-version=4.1-preview.1" -Method Post -Body $body;
}
