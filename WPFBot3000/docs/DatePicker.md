---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.datepicker
schema: 2.0.0
---

# DatePicker

## SYNOPSIS
A DatePicker control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DatePicker class

## SYNTAX

```
DatePicker [[-Name] <String>] [[-InitialValue] <DateTime>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A DatePicker control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

TextBox EmailAddress
    DatePicker BirthDate
} -Property @{ Title = 'DatePicker' }

## PARAMETERS

### -Name
The name of the control

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

### -InitialValue
The date to set the control to

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: (get-date)
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
Position: 3
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.datepicker](https://msdn.microsoft.com/en-us/library/system.windows.controls.datepicker)

