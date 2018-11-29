Import-Module '..\..\AzureDevOps' -Force;

# Add connection details
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

Install-AzureDevOpsNuGetPackage -Source "myfeed" -Name "Contoso.Examples.Shared" -Version "1.1.0.22";
