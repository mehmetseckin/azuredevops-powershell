# AzureDevOps

[![Build Status](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_apis/build/status/azuredevops-powershell-ci)](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_build/latest?definitionId=1)

AzureDevOps is a very simple (and primitive) PowerShell module to interact with the Azure DevOps REST API.

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

## Documentation

Documentation for the individual commands is available in the [Docs](./Docs) folder.

## Alternatives

 * [vsteam](https://github.com/DarqueWarrior/vsteam) - A comprehensive PowerShell module for accessing TFS and VSTS.
 * [AzureDevOpsPowerShell](https://github.com/rfennell/AzureDevOpsPowershell) - A selection of PowerShell scripts that make use of the Azure DevOps (TFS/VSTS) APIs.
 * [vststools-cli](https://github.com/AssureCare/vststools-cli) - A set of useful command-line tools and extensions for VSTS.
