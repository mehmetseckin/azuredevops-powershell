# AzureDevOps.PowerShell

[![Build status](https://ci.appveyor.com/api/projects/status/30m115gw52ens456?svg=true)](https://ci.appveyor.com/project/seckin92/azuredevops-powershell)
![AppVeyor tests](https://img.shields.io/appveyor/tests/seckin92/azuredevops-powershell.svg)
![Test Coverage](https://img.shields.io/badge/coverage-6%25-red.svg?maxAge=60)


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
