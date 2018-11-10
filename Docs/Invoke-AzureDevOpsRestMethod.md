---
external help file: AzureDevOps.Common-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Invoke-AzureDevOpsRestMethod

## SYNOPSIS
Invokes an Azure DevOps REST API method.

## SYNTAX

```
Invoke-AzureDevOpsRestMethod [[-PartialUri] <String>] [[-Method] <String>] [[-Body] <String>]
```

## DESCRIPTION
Invokes an Azure DevOps REST API method using the account details previously saved by Add-AzureDevOpsAccount.

## EXAMPLES

### EXAMPLE 1
```
Invoke-AzureDevOpsRestMethod -PartialUrl "/distributedtask/variablegroups/?api-version=4.1-preview.1" -Method "Get"
```

## PARAMETERS

### -PartialUri
{{Fill PartialUri Description}}

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

### -Method
The method to use when invoking the Azure DevOps REST API.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Get
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
The request body to use when invoking the Azure DevOps REST API.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
