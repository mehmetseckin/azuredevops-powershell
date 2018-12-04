@{
    PSDependOptions = @{
        Paramaters = @{
            Scope = 'CurrentUser'
        }
    }
    
    psake            = 'latest'
    Pester           = @{
        Version = 'latest'
        Parameters = @{
            SkipPublisherCheck = $true
        }
    }
    BuildHelpers     = 'latest'
    PSScriptAnalyzer = 'latest'
    platyPS          = 'latest'
}