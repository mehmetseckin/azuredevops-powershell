function Install-AzureDevOpsPackage
{
    <#
    .SYNOPSIS
    Installs a package from an Azure Artifacts feed.

    .DESCRIPTION
    Installs a package from an Azure Artifacts feed using the Azure Artifacts REST API.

    .PARAMETER Source
    The name or GUID of the package feed.

    .PARAMETER Provider
    The type of the feed. This can be "nuget", "npm", "maven", etc.

    .PARAMETER Name
    The name of the package to download.

    .PARAMETER Version
    The version of the package to download

    .PARAMETER OutFile
    The file name for the downloaded package.

    .EXAMPLE
    Install-AzureDevOpsPackage -Provider "nuget" -Source "myfeed" -Name "Contoso.Examples.Shared" -Version "1.1.0.22" -OutFile "Contoso.Examples.Shared.1.1.0.22.nupkg";

    Downloads a NuGet package.

    .EXAMPLE
    Install-AzureDevOpsPackage -Provider "npm" -Source "myfeed" -Name "contoso-example-shared" -Version "1.1.0" -OutFile "contoso-example-shared.1.1.0.tgz";

    Downloads an npm package.
    #>
    param
    (
        [string]$Source,
        [string]$Provider,
        [string]$Name,
        [string]$Version,
        [string]$OutFile
    )

    if(-not $AzureDevOpsAccount)
    {
        throw "Please run Add-AzureDevOpsAccount to connect to Azure DevOps.";
    }

    $organisationName = $AzureDevOpsAccount.OrganisationName;
    $authorizationHeader = $AzureDevOpsAccount.AuthorizationHeader;
    $header = @{Authorization = "Basic $authorizationHeader"};
    $uri = "https://$organisationName.pkgs.visualstudio.com/_apis/packaging/feeds/$source/$provider/packages/$name/versions/$version/content";

    Write-Verbose "Downloading $name $version from $provider feed '$source'...";
    Invoke-WebRequest -Uri $uri -Header $header -Method Get -OutFile $outFile;
    Write-Verbose "Downloaded $name $version into $outFile";
}