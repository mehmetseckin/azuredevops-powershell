Import-Module '..\..\AzureDevOps' -Force;

# Connect to contoso
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

# Get the existing group
$groups = Get-AzureDevOpsVariableGroup -SearchString "Demo Variable Group";
$group = $groups[0];

# Connect to fabrikam
Add-AzureDevOpsAccount `
    -OrganisationName "fabrikam" `
    -ProjectName "Fabrikam Project" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

# Create the group in fabrikam
Add-AzureDevOpsVariableGroup -Group $group;