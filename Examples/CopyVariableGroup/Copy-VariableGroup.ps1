Import-Module '..\..\AzureDevOps' -Force;

# Add connection details
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

Copy-AzureDevOpsVariableGroup -GroupName "Demo Variable Group" -NewGroupName "Demo Variable Group 2";