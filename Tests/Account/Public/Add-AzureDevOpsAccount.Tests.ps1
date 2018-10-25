Import-Module "$PSScriptRoot\..\..\..\AzureDevOps\Account" -Force;

Describe "Add-AzureDevOpsAccount" {

    $organisationName = "contoso";
    $projectName = "adventure-works";
    $userName = "mehmet.seckin@contoso.com";
    $token = "<personal-access-token>";

    It 'Sets a global variable named AzureDevOpsAccount' {
        
        Add-AzureDevOpsAccount `
            -OrganisationName $organisationName `
            -ProjectName $projectName `
            -UserName $userName `
            -Token $token;

        Get-Variable -Name "AzureDevOpsAccount" -Scope Global | Should Not Be $null
        Set-Variable -Name "AzureDevOpsAccount" -Value $null;
    }
    
    It 'Stores the account information in the properties of AzureDevOpsAccount global variable' {
        
        Add-AzureDevOpsAccount `
            -OrganisationName $organisationName `
            -ProjectName $projectName `
            -UserName $userName `
            -Token $token;

        $AzureDevOpsAccount.OrganisationName | Should Be $organisationName;
        $AzureDevOpsAccount.ProjectName | Should Be $projectName;
        $AzureDevOpsAccount.UserName | Should Be $userName;
        $AzureDevOpsAccount.PersonalAccessToken | Should Be $token;

        Set-Variable -Name "AzureDevOpsAccount" -Value $null;
    }

    It 'Encodes the personal access token to include it in Basic authentication headers' {

        $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $userName, $token)));
        
        Add-AzureDevOpsAccount `
            -OrganisationName $organisationName `
            -ProjectName $projectName `
            -UserName $userName `
            -Token $token;
            
        $AzureDevOpsAccount.AuthorizationHeader | Should Be $base64AuthInfo;
        Set-Variable -Name "AzureDevOpsAccount" -Value $null;
    }
    
    It 'Constructs a base API url to use for the requests' {

        $baseApiUrl = "https://dev.azure.com/$organisationName/$projectName/_apis";

        Add-AzureDevOpsAccount `
            -OrganisationName $organisationName `
            -ProjectName $projectName `
            -UserName $userName `
            -Token $token;
            
        $AzureDevOpsAccount.BaseApiUrl | Should Be $baseApiUrl;
        Set-Variable -Name "AzureDevOpsAccount" -Value $null;
    }
}