$ModuleName = "Account";
Import-Module "$PSScriptRoot\..\..\AzureDevOps\$ModuleName" -Force;

Describe "$ModuleName submodule behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    
    It 'Exports a function named Add-AzureDevOpsAccount' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Add-AzureDevOpsAccount') | Should Be $True;
    }

    It 'Exports the alias with a name "Connect-AzureDevOpsAccount" and the definition "Add-AzureDevOpsAccount"' {
        $ModuleInfo.ExportedAliases."Connect-AzureDevOpsAccount".Definition | Should Be 'Add-AzureDevOpsAccount';
    }
    
    It 'Exports the alias with a name "Login-AzureDevOpsAccount" and the definition "Add-AzureDevOpsAccount"' {
        $ModuleInfo.ExportedAliases."Login-AzureDevOpsAccount".Definition | Should Be 'Add-AzureDevOpsAccount';
    }
}