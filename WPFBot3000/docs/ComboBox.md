---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# ComboBox

## SYNOPSIS
A combobox control

## SYNTAX

```
ComboBox [[-name] <String>] [[-contents] <Array>] [[-initialValue] <Object>] [[-property] <Hashtable>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a combobox control with a given set of contents and optionally a selected value.

## EXAMPLES

### EXAMPLE 1
```
dialog {
```

Combobox Guess -contents 'a','b','c' -initialvalue 'b'
}
# A Dialog box with combobox having 3 choices, the second is selected.

## PARAMETERS

### -name
The name of the control. 
This will be the name of a property of the output of the Dialog function.

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

### -contents
A list of items to fill the combobox.

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -initialValue
The item from $Contents that is initially selected.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: @{}
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
