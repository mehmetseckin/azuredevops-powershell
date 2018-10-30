function Install-AzureDevOpsNuGetPackage
{
    <#
    .SYNOPSIS
    Installs a NuGet package from an Azure Artifacts feed.

    .DESCRIPTION
    Installs a NuGet package from an Azure Artifacts feed using the Azure Artifacts REST API.

    .PARAMETER Source
    The name or GUID of the package feed.

    .PARAMETER Name
    The name of the package to download.

    .PARAMETER Version
    The version of the package to download

    .PARAMETER OutFile
    The file name for the downloaded package. Defaults to `<name>.<version>.nupkg`.

    .EXAMPLE
    Install-AzureDevOpsNuGetPackage -Source "myfeed" -Name "Contoso.Examples.Shared" -Version "1.1.0.22";
    #>
    param
    (
        [string]$Source,
        [string]$Name,
        [string]$Version,
        [string]$OutFile
    )

    if(-not $OutFile)
    {
        $OutFile = "$name.$version.nupkg";
    }

    return Install-AzureDevOpsPackage `
        -Provider "nuget" `
        -Source $Source `
        -Name $Name `
        -Version $Version `
        -OutFile $OutFile;
}