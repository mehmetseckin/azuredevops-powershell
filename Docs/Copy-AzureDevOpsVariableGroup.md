---
external help file: AzureDevOps.VariableGroups-help.xml
Module Name: AzureDevOps
online version:
schema: 2.0.0
---

# Copy-AzureDevOpsVariableGroup

## SYNOPSIS
Copy a variable group by ID

## SYNTAX

### GroupId
```
Copy-AzureDevOpsVariableGroup -GroupId <String> [-NewGroupName <String>] [<CommonParameters>]
```

### GroupName
```
Copy-AzureDevOpsVariableGroup -GroupName <String> [-NewGroupName <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates a copy of the specified variable group

## EXAMPLES

### EXAMPLE 1
```
Copy-AzureDevOpsVariableGroup -GroupId "2"
```

## PARAMETERS

### -GroupId
The variable group ID to copy

```yaml
Type: String
Parameter Sets: GroupId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GroupName
The source variable group name.

```yaml
Type: String
Parameter Sets: GroupName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NewGroupName
The name for the newly created variable group.
This will default to the source name with a (Copy) suffix.

```yaml
Type: String
Parameter Sets: (All)
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
