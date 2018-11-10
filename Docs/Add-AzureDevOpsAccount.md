---
external help file: AzureDevOps.Account-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Add-AzureDevOpsAccount

## SYNOPSIS
Add your Azure DevOps account to interact with the Azure DevOps REST API.

## SYNTAX

```
Add-AzureDevOpsAccount [[-OrganisationName] <String>] [[-ProjectName] <String>] [[-UserName] <String>]
 [[-Token] <String>]
```

## DESCRIPTION
Saves your account details in a global variable named `$AzureDevOpsAccount` for the other cmdlets to use.

## EXAMPLES

### EXAMPLE 1
```
Add-AzureDevOpsAccount -OrganisationName "contoso" -ProjectName "adventureapp" -UserName "mehmet.seckin@contoso.com" -Token "your-personal-access-token"
```

## PARAMETERS

### -OrganisationName
Your Azure DevOps organisation name

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

### -ProjectName
Your Azure DevOps project name

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

### -UserName
Your Azure DevOps user name

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

### -Token
Your Azure DevOps personal access token

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
