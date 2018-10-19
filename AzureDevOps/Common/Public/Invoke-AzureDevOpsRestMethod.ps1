function Invoke-AzureDevOpsRestMethod
{
    <#
    .SYNOPSIS
    Invokes an Azure DevOps REST API method.

    .DESCRIPTION
    Invokes an Azure DevOps REST API method using the account details previously saved by Add-AzureDevOpsAccount.

    .PARAMETER PartialUrl
    The partial URL for the Azure DevOps REST API endpoint.

    .PARAMETER Method
    The method to use when invoking the Azure DevOps REST API.

    .PARAMETER Body
    The request body to use when invoking the Azure DevOps REST API.

    .EXAMPLE
    Invoke-AzureDevOpsRestMethod -PartialUrl "/distributedtask/variablegroups/?api-version=4.1-preview.1" -Method "Get"
    #>
    param
    (
        [string]$PartialUri,
        [string]$Method = "Get",
        [string]$Body = ""
    )

    if(-not $AzureDevOpsAccount)
    {
        throw "Please run Add-AzureDevOpsAccount to connect to Azure DevOps.";
    }

    $uri = "$($AzureDevOpsAccount.BaseApiUrl)/$PartialUri";

    if($Method -eq "Get")
    {
        $result = Invoke-RestMethod -Uri $uri -Method $Method -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $AzureDevOpsAccount.AuthorizationHeader)}
    }
    else
    {
        $result = Invoke-RestMethod -Uri $uri -Method $Method -Body $Body -ContentType "application/json" -Headers @{Authorization=("Basic {0}" -f $AzureDevOpsAccount.AuthorizationHeader)}
    }
    return $result;
}