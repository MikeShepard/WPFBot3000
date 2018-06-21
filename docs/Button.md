---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# Button

## SYNOPSIS
Outputs a WPF Button control

## SYNTAX

```
Button [[-Caption] <Object>] [[-Action] <ScriptBlock>] [[-property] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Outputs a WPF Button control with a caption and an action.

## EXAMPLES

### EXAMPLE 1
```
(Window {
    TextBox Name
    Button "Say Hello" -Action {$t=$this.Window.GetControlByName('Name');
                                                  Write-Host "Hello, $($t.Text)"}
}).ShowDialog()

```

## PARAMETERS

### -Caption
Text for the button

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

### -Action
Scriptblock for the Click event of the button

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

### -property
Properties to extend/override the base properties defined in the function

```yaml
Type: Object
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
The command does not receive pipeline input
## OUTPUTS
System.Windows.Controls.Button
## NOTES
General notes

## RELATED LINKS
