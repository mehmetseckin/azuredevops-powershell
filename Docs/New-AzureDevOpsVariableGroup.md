---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# New-AzureDevOpsVariableGroup

## SYNOPSIS
Create a new variable group object

## SYNTAX

```
New-AzureDevOpsVariableGroup [[-Name] <String>] [[-Description] <String>] [[-Variables] <PSObject[]>]
```

## DESCRIPTION
Creates a new variable group object.

## EXAMPLES

### EXAMPLE 1
```
$Variables = @();
```

$Variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
$Variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -Secret;
$myGroup = New-AzureDevOpsVariableGroup -Name "MyVariableGroup" -Value "MyValue" -Variables $Variables

## PARAMETERS

### -Name
The name of the new variable group.

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

### -Description
The description of the variable group.

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

### -Variables
The variables contained in the variable group.

```yaml
Type: PSObject[]
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
