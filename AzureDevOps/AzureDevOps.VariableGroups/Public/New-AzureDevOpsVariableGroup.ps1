function New-AzureDevOpsVariableGroup
{
    <#
    .SYNOPSIS
    Create a new variable group object

    .DESCRIPTION
    Creates a new variable group object.

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
    $myGroup = New-AzureDevOpsVariableGroup -Name "MyVariableGroup" -Value "MyValue" -Variables $Variables
    #>

    param
    (
        [string]$Name,
        [string]$Description,
        [PSCustomObject[]]$Variables
    )

    $group = [PSCustomObject]@{
        name = $Name
        description = $Description
        variables = [PSCustomObject]@{}
        $type = "Vsts"
    }

    foreach($variable in $Variables) {
        Add-Member -InputObject $group.variables -MemberType NoteProperty -Name $variable.Name -Value $variable.Value;
    }

    return $group;
}