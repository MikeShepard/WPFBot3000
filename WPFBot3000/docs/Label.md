---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.label
schema: 2.0.0
---

# Label

## SYNOPSIS
A Label control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Label class

## SYNTAX

```
Label [[-Text] <String>] [[-Name] <String>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Label control

## EXAMPLES

### EXAMPLE 1
```
Import-Module WPFBot3000 -force
```

$w=Window {
    Textbox Name -Property @{ MinWidth=50}
    Button Personalize -Action {
                                 $Greeting.Content="Hello, $($Name.Text)"}
    Label 'Hello, World' -name 'Greeting'
} -ShowForValue

## PARAMETERS

### -Text
the text of the label

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

### -Name
The name of the control

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.label](https://msdn.microsoft.com/en-us/library/system.windows.controls.label)

