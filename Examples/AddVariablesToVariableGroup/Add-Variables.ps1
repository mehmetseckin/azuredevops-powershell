Import-Module '..\..\AzureDevOps'; 

# Add connection details
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";

# Retrieve existing variable group
$groups = Get-AzureDevOpsVariableGroup -SearchString "Demo Variable Group";
$group = $groups[0];

# Read variables from the JSON file and add them to the variable group
$vars = Get-Content .\vars.json | ConvertFrom-Json;
$vars | Get-Member -MemberType NoteProperty | ForEach-Object {
    $Name = $_.Name
    $Value = $vars."$Name"
    Write-Host "Adding $Name = $Value"
    $null = Add-AzureDevOpsVariableToVariableGroup -GroupId $group.id -Name $Name -Value $Value
}
