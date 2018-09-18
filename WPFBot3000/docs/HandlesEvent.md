---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.groupbox
schema: 2.0.0
---

# HandlesEvent

## SYNOPSIS
Adds an event handler to a control

## SYNTAX

```
HandlesEvent [[-EventName] <String>] [[-Action] <ScriptBlock>] [[-Control] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Adds an event handler to a control

## EXAMPLES

### EXAMPLE 1
```
$w=Window {
```

TextBox Fred -property @{MinWidth=50}
    CheckBox Barney | HandlesEvent Checked {$Fred.Text=$fred.Text.ToUpper()}
} -ShowForValue

## PARAMETERS

### -EventName
The name of the event to be handled (without On)

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

### -Action
The action to be executed when the event is triggered

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Control
The control that the event is for

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
