---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox
schema: 2.0.0
---

# ComboBox

## SYNOPSIS
A ComboBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ComboBox class

## SYNTAX

```
ComboBox [[-Name] <String>] [[-Contents] <Array>] [[-InitialValue] <Object>] [[-Property] <Hashtable>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a ComboBox control with a given set of contents and optionally a selected value.

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Combobox Guess -contents 'a','b','c' -initialvalue 'b'
} -Property @{ Title = 'ComboBox' }
# A Dialog box with ComboBox having 3 choices, the second is selected.

## PARAMETERS

### -Name
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

### -Contents
A list of items to fill the ComboBox.

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

### -InitialValue
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

### -Property
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

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox](https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox)

