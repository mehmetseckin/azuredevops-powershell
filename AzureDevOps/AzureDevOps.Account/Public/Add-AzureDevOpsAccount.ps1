function Add-AzureDevOpsAccount
{
    <#
    .SYNOPSIS
    Add your Azure DevOps account to interact with the Azure DevOps REST API.

    .DESCRIPTION
    Saves your account details in a global variable named `$AzureDevOpsAccount` for the other cmdlets to use.

    .PARAMETER OrganisationName
    Your Azure DevOps organisation name

    .PARAMETER ProjectName
    Your Azure DevOps project name

    .PARAMETER Token
    Your Azure DevOps personal access token

    .EXAMPLE
    Add-AzureDevOpsAccount -OrganisationName "contoso" -ProjectName "adventureapp" -UserName "mehmet.seckin@contoso.com" -Token "<your personal access token>"
    #>
    param
    (
       [string]$OrganisationName = "",
       [string]$ProjectName = "",
       [string]$UserName = "",
       [string]$Token = ""
    )

    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $UserName,$Token)));
    $baseApiUrl = "https://dev.azure.com/$($OrganisationName)/$($ProjectName)/_apis";
    $azureDevOpsAccountObject = [PSCustomObject]@{
        OrganisationName = $OrganisationName
        ProjectName = $ProjectName
        UserName = $UserName
        PersonalAccessToken = $Token
        BaseApiUrl = $baseApiUrl
        AuthorizationHeader = $base64AuthInfo
    }

    Set-Variable -Name "AzureDevOpsAccount" -Value $azureDevOpsAccountObject -Scope Global;
}