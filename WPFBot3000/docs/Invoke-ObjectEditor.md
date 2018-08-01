---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Invoke-ObjectEditor

## SYNOPSIS
POC Function that lets you edit properties of an object

## SYNTAX

```
Invoke-ObjectEditor [[-inputobject] <Object>] [[-Property] <String[]>] [[-LabelMap] <Hashtable>] [-InPlace]
 [<CommonParameters>]
```

## DESCRIPTION
Builds UI for selected properties (infers control type from property type). 
Very limited functionality
Only properties with types that the function can infer will have UI generated for them.

## EXAMPLES

### EXAMPLE 1
```
$a=[PSCustomObject]@{Prop1='A';Prop2=150}
```

$a | Invoke-ObjectEditor -property Prop1, Prop2

## PARAMETERS

### -inputobject
The object that has properties you want to edit

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Property
The properties you want to edit (wildcards are allowed)

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LabelMap
A hashtable with items of the form PropertyName='Desired label'. 
If the property has UI generated it will use this text instead of the property name.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -InPlace
If true, the function sets the properties to the new values on the existing object and outputs nothing.
If false, the function outputs an object with the "Edited" properties.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
