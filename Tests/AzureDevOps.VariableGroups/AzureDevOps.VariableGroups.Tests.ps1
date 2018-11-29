$ModuleName = "AzureDevOps.VariableGroups";
Import-Module "$PSScriptRoot\..\..\AzureDevOps\$ModuleName" -Force;

Describe "$ModuleName submodule behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    
    It 'Exports a function named Add-AzureDevOpsVariable' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Add-AzureDevOpsVariable') | Should Be $True;
    }

    It 'Exports a function named Get-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Get-AzureDevOpsVariableGroup') | Should Be $True;
    }

    It 'Exports a function named Copy-AzureDevOpsVariableGroup' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Copy-AzureDevOpsVariableGroup') | Should Be $True;
    }

    It 'Exports a function named New-AzureDevOpsVariable' {
        $ModuleInfo.ExportedFunctions.ContainsKey('New-AzureDevOpsVariableGroup') | Should Be $True;
    }
}