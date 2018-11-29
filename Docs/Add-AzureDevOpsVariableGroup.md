---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Add-AzureDevOpsVariableGroup

## SYNOPSIS
Create a new variable group

## SYNTAX

```
Add-AzureDevOpsVariableGroup [[-Group] <PSObject>]
```

## DESCRIPTION
Creates a new variable group using the currently added Azure DevOps account.

## EXAMPLES

### EXAMPLE 1
```
$variables = @();
```

$variables += New-AzureDevOpsVariable -Name "MyVariable" -Value "MyVariableValue";
$variables += New-AzureDevOpsVariable -Name "MySecretVariable" -Value "MySecretVariableValue" -IsSecret $true;
$group = New-AzureDevOpsVariableGroup -Name "MyGroup" -Description "My Awesome Group" -Variables $variables;
Add-AzureDevOpsVariableGroup -Group $group

## PARAMETERS

### -Group
The variable group object.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
