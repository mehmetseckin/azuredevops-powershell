function New-AzureDevOpsVariable
{
    <#
    .SYNOPSIS
    Create a new Azure DevOps variable 

    .DESCRIPTION
    Creates a new Azure DevOps variable 

    .PARAMETER Name
    The name of the variable.

    .PARAMETER Value
    The value of the variable.

    .PARAMETER IsSecret
    Boolean value to specify whether this is a secret variable

    .EXAMPLE
    $Variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
    $Variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -IsSecret $true;
    #>
    param
    (
        [string]$Name,
        [string]$Value,
        [bool]$IsSecret
    )

    $valueObject = [PSCustomObject]@{
        value = $Value
        isSecret = $IsSecret
    };

    $variable = [PSCustomObject]@{
        Name = $Name
        Value = $valueObject
    };

    return $variable
}