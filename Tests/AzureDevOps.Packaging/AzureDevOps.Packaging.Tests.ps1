$ModuleName = "AzureDevOps.Packaging";
Import-Module "$PSScriptRoot\..\..\AzureDevOps\$ModuleName" -Force;

Describe "$ModuleName submodule behaviour" {
    $ModuleInfo = Get-Module -Name $ModuleName;
    
    It 'Exports a function named Install-AzureDevOpsNuGetPackage' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Install-AzureDevOpsNuGetPackage') | Should Be $True;
    }

    It 'Exports a function named Install-AzureDevOpsNpmPackage' {
        $ModuleInfo.ExportedFunctions.ContainsKey('Install-AzureDevOpsNpmPackage') | Should Be $True;
    }
}