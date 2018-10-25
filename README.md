# AzureDevOps.PowerShell

[![Build Status](https://dev.azure.com/seckin92/azuredevops-powershell/_apis/build/status/seckin92.azuredevops-powershell)](https://dev.azure.com/seckin92/azuredevops-powershell/_build/latest?definitionId=1)

This is a very simple (and primitive) PowerShell module to interact with the Azure DevOps REST API.

## Getting started

1. Clone the repository
2. Import the module

```powershell
Import-Module '\path\to\AzureDevOps'
```

3. Add connection details

```powershell
# Add Azure DevOps connection details
Add-AzureDevOpsAccount `
    -OrganisationName "contoso" `
    -ProjectName "AzureDevOps PowerShell Demo" `
    -UserName "user@name.com" `
    -Token "<azure-devops-personal-access-token>";
```

4. Check out the examples in the [Examples](./Examples) folder.

5. Or, check out the list of available cmdlets

```powershell
Get-Command *AzureDevOps*
```

6. Use `Get-Help` to see details for the cmdlets.

```powershell
Get-Help Add-AzureDevOpsAccount -Detailed
```

## Alternatives

 * [vsteam](https://github.com/DarqueWarrior/vsteam) - A comprehensive PowerShell module for accessing TFS and VSTS.
