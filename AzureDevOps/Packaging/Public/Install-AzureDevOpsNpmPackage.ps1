function Install-AzureDevOpsNpmPackage
{
    <#
    .SYNOPSIS
    Installs an npm package from an Azure Artifacts feed.

    .DESCRIPTION
    Installs an npm package from an Azure Artifacts feed using the Azure Artifacts REST API.

    .PARAMETER Source
    The name or GUID of the package feed.

    .PARAMETER Name
    The name of the package to download.

    .PARAMETER Version
    The version of the package to download

    .PARAMETER OutFile
    The file name for the downloaded package. Defaults to `<name>.<version>.tgz`.

    .EXAMPLE
    Install-AzureDevOpsNpmPackage -Source "myfeed" -Name "contoso-example-shared" -Version "1.1.0";
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
        $OutFile = "$name.$version.tgz";
    }

    return Install-AzureDevOpsPackage `
        -Provider "npm" `
        -Source $Source `
        -Name $Name `
        -Version $Version `
        -OutFile $OutFile;
}