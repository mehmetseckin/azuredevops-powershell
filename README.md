![AzureDevOps icon](./Assets/azuredevops.png)

# AzureDevOps

[![Build Status](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_apis/build/status/azuredevops-powershell-ci)](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_build/latest?definitionId=1)
[![Azure DevOps Tests](https://img.shields.io/azure-devops/tests/azuredevops-powershell/azuredevops-powershell/1.svg?logo=azuredevops)](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_build/latest?definitionId=1)
[![Azure DevOps Coverage](https://img.shields.io/azure-devops/coverage/azuredevops-powershell/azuredevops-powershell/1.svg?logo=azuredevops)](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_build/latest?definitionId=1)
[![Azure DevOps Release - PowerShell Gallery](https://vsrm.dev.azure.com/azuredevops-powershell/_apis/public/Release/badge/4d81da9c-b02f-4f9a-8775-c8444d950246/1/1)](https://dev.azure.com/azuredevops-powershell/azuredevops-powershell/_release/)
[![AzureDevOps PSGallery version](https://img.shields.io/powershellgallery/v/AzureDevOps.svg)](https://www.powershellgallery.com/packages/AzureDevOps)
[![AzureDevOps PSGallery downloads](https://img.shields.io/powershellgallery/dt/AzureDevOps.svg?logo=powershell)](https://www.powershellgallery.com/packages/AzureDevOps)

AzureDevOps is a very simple (and primitive) PowerShell module to interact with the Azure DevOps REST API.

## Getting started

1. Install the module

   ```powershell
   Install-Module AzureDevOps
   ```

2. Import the module

   ```powershell
   Import-Module AzureDevOps
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

4. Check out the examples in the [Examples](https://github.com/mehmetseckin/azuredevops-powershell/tree/master/Examples) folder.

5. Or, check out the list of available cmdlets

   ```powershell
   Get-Command *AzureDevOps*
   ```

6. Use `Get-Help` to see details for the cmdlets.

   ```powershell
   Get-Help Add-AzureDevOpsAccount -Detailed
   ```

## Documentation

Documentation for the individual commands is available in the [Docs](https://github.com/mehmetseckin/azuredevops-powershell/blob/master/Docs/AzureDevOps.md) folder.

## References

- [Azure DevOps CLI](https://learn.microsoft.com/en-us/azure/devops/cli/?view=azure-devops)
- [Azure DevOps Services REST API Reference](https://learn.microsoft.com/en-us/rest/api/azure/devops/)
- [Azure DevOps Developer resources documentation | Microsoft Learn](https://learn.microsoft.com/en-us/azure/devops/dev-resources/?view=azure-devops)
- [How to use the Azure DevOps REST API with PowerShell | YouTube](https://www.youtube.com/watch?v=ylJmee-4KTo)

## Similar projects

* [vsteam](https://github.com/DarqueWarrior/vsteam) - A comprehensive PowerShell module for accessing TFS and VSTS.
* [AzureDevOpsPowerShell](https://github.com/rfennell/AzureDevOpsPowershell) - A selection of PowerShell scripts that make use of the Azure DevOps (TFS/VSTS) APIs.
* [vststools-cli](https://github.com/AssureCare/vststools-cli) - A set of useful command-line tools and extensions for VSTS.
* [AzurePipelinesPS](https://github.com/Dejulia489/AzurePipelinesPS) - A PowerShell module that makes interfacing with Azure Pipelines a little easier
