Import-Module "$PSScriptRoot\..\..\..\AzureDevOps\AzureDevOps.Common" -Force;

Describe "Invoke-AzureDevOpsRestMethod" {

    Context 'Azure DevOps account was not added' {

        BeforeAll {
            Set-Variable -Name "AzureDevOpsAccount" -Scope Global -Value $null -Force;
        }

        It 'Throws an error message' {
        
            { Invoke-AzureDevOpsRestMethod } | 
                Should -Throw;
        }
    }
    
    Context 'Azure DevOps account was added' {

        BeforeAll {
            Set-Variable -Name "AzureDevOpsAccount" -Scope Global -Value $true -Force;
        }

        Mock -ModuleName AzureDevOps.Common -CommandName Invoke-RestMethod { 
            "Invoke-RestMethod called."
        }

        It 'Calls Invoke-RestMethod once' {
        
            Invoke-AzureDevOpsRestMethod
            Assert-MockCalled -ModuleName AzureDevOps.Common -CommandName Invoke-RestMethod -Exactly -Times 1;
        }
    }
}