---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# ComboBox

## SYNOPSIS
A combobox control

## SYNTAX

```
ComboBox [[-name] <Object>] [[-contents] <Object>] [[-initialValue] <Object>] [[-property] <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a combobox control with a given set of contents and optionally a selected value.

## EXAMPLES

### EXAMPLE 1
```
dialog {
    Combobox Guess -contents 'a','b','c' -initialvalue 'b'
}
```
Dialog box with combobox having 3 choices, the second is selected.

## PARAMETERS

### -name
The name of the control.  This will be the name of a property of the output of the Dialog function.

```yaml
Type: Object
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
Type: Object
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
Property values for the control

```yaml
Type: Object
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
This command accepts no pipleline input

## OUTPUTS
A combobox control

## NOTES
General notes

## RELATED LINKS
