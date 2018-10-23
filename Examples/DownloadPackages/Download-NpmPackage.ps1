Import-Module '..\..\AzureDevOps'; 

# Add connection details
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

Install-AzureDevOpsNpmPackage -Source "myfeed" -Name "contoso-example-shared" -Version "1.1.0";
