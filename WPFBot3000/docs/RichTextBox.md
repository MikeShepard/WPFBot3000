---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# RichTextBox

## SYNOPSIS
A RichTextbox control

## SYNTAX

```
RichTextBox [[-Name] <String>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A RichTextbox control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

TextBox FirstName
    TextBox LastName
    RichTextBox Description
    DatePicker ReminderDate
}

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

### -property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
