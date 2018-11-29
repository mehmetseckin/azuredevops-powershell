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
Add-AzureDevOpsVariable [[-GroupId] <String>] [[-Variable] <PSObject>]
```

## DESCRIPTION
Adds or updates a variable in the specified variable group

## EXAMPLES

### EXAMPLE 1
```
$myVariable = New-AzureDevOpsVariable -Name "MyVar" -Value "MyValue";
```

Add-AzureDevOpsVariable -GroupId "2" -Variable $myVariable;

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

### -Variable
The variable object to add

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
