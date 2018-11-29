---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# New-AzureDevOpsVariable

## SYNOPSIS
Create a new Azure DevOps variable

## SYNTAX

```
New-AzureDevOpsVariable [[-Name] <String>] [[-Value] <String>] [[-IsSecret] <Boolean>]
```

## DESCRIPTION
Creates a new Azure DevOps variable

## EXAMPLES

### EXAMPLE 1
```
$Variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
```

$Variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -IsSecret $true;

## PARAMETERS

### -Name
The name of the variable.

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

### -Value
The value of the variable.

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

### -IsSecret
Boolean value to specify whether this is a secret variable

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
