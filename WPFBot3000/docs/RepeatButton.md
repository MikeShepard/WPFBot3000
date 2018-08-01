---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# RepeatButton

## SYNOPSIS
A Repeat button control

## SYNTAX

```
RepeatButton [[-Caption] <String>] [[-Action] <ScriptBlock>] [[-property] <Hashtable>] [[-name] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a WPF RepeatButton control with a caption and an action. 
Note, to set the delay and interval properties, include them in the -Property hashtable.

## EXAMPLES

### EXAMPLE 1
```
(Window {
```

TextBox Name
    RepeatButton "Say Hello" -Action {$t=$this.Window.GetControlByName('Name');
                                                  Write-Host "Hello, $($t.Text) : $(Get-date)"}
}).ShowDialog()

## PARAMETERS

### -Caption
The text on the button

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
The action performed when the button is clicked

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
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -name
The Name of the control.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
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
