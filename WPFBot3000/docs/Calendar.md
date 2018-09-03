---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.calendar
schema: 2.0.0
---

# Calendar

## SYNOPSIS
A calendar control

## SYNTAX

```
Calendar [[-Name] <String>] [[-InitialValue] <DateTime>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Calendar control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Calendar class

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

TextBox EmailAddress
    Calendar BirthDate
} -Property @{ Title = 'Calendar' }

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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.calendar](https://msdn.microsoft.com/en-us/library/system.windows.controls.calendar)

