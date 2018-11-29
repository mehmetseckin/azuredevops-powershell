---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Add-AzureDevOpsVariable

## SYNOPSIS
Add or update a variable to a specified variable group

## SYNTAX

```
Add-AzureDevOpsVariable [[-GroupId] <String>] [[-Name] <String>] [[-Value] <String>] [[-IsSecret] <String>]
```

## DESCRIPTION
Adds or updates a variable in the specified variable group

## EXAMPLES

### EXAMPLE 1
```
Add-AzureDevOpsVariable -GroupId "2" -Name "MyVar" -Value "MyValue"
```

## PARAMETERS

### -GroupId
The ID of the variable group to add/update the variable in.

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
The variable name

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

### -Value
The value for the variable

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

### -IsSecret
The IsSecret flag for the variable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
