---
external help file: AzureDevOps.Packaging-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Install-AzureDevOpsNpmPackage

## SYNOPSIS
Installs an npm package from an Azure Artifacts feed.

## SYNTAX

```
Install-AzureDevOpsNpmPackage [[-Source] <String>] [[-Name] <String>] [[-Version] <String>]
 [[-OutFile] <String>]
```

## DESCRIPTION
Installs an npm package from an Azure Artifacts feed using the Azure Artifacts REST API.

## EXAMPLES

### EXAMPLE 1
```
Install-AzureDevOpsNpmPackage -Source "myfeed" -Name "contoso-example-shared" -Version "1.1.0";
```

## PARAMETERS

### -Source
The name or GUID of the package feed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the package to download.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Version
The version of the package to download

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutFile
The file name for the downloaded package.
Defaults to \`\<name\>.\<version\>.tgz\`.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
