---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Get-AzureDevOpsVariableGroup

## SYNOPSIS
Retrieve a variable group or a set of variable groups.

## SYNTAX

### GroupId (Default)
```
Get-AzureDevOpsVariableGroup [-GroupId <String>] [<CommonParameters>]
```

### SearchString
```
Get-AzureDevOpsVariableGroup [-SearchString <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieves a variable group by its ID or a set of variable groups based on a search string.

## EXAMPLES

### EXAMPLE 1
```
Get-AzureDevOpsVariableGroup -GroupId "2"
```

Gets the variable group with ID: "2".

### EXAMPLE 2
```
Get-AzureDevOpsVariableGroup -SearchString "contoso"
```

Gets variable groups which have names starting with "contoso".

## PARAMETERS

### -GroupId
The variable group ID.
If this parameter is specified.
the variable group with the specified ID will be retrieved.

```yaml
Type: String
Parameter Sets: GroupId
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchString
The search string.
If this parameter is specified, the variable groups whose names start with the specified search string will be retrieved.

```yaml
Type: String
Parameter Sets: SearchString
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
