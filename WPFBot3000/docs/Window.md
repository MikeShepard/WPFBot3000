---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Window

## SYNOPSIS
Outputs a window with the indicated wpf controls.

## SYNTAX

```
Window [[-Contents] <ScriptBlock>] [[-labelMap] <Hashtable>] [[-Events] <Hashtable[]>] [[-title] <String>]
 [-HideLabels] [[-property] <Hashtable>] [-ShowGridLines] [-ShowForValue] [<CommonParameters>]
```

## DESCRIPTION
Creates a window object with 2-columns (labels and controls) or 1-column (using -HideLabels, with controls only).
Outputs the window without displaying it.
Note, the window doesn't build its own ok/cancel buttons so you are responsible for that.

## EXAMPLES

### EXAMPLE 1
```
$w=Window {
```

Textbox Name
    Button Personalize -name mike -action {
                                 $txt=$this.Window.GetControlByName('Name')
                                 $lbl=$this.Window.GetControlByName('Greeting')
                                 $lbl.Content="Hello, $($txt.Text)"}
    Label 'Hello, World' -name 'Greeting'
}
$w.ShowDialog()

## PARAMETERS

### -Contents
A scriptblock that outputs the controls you want in the window

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -labelMap
A hashtable with items of the form ControlName='Desired label'. 
If the control is labeled it will use this text instead of the control name.

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

### -Events
An array of hashtables of event handlers for controls in the dialog. 
Each should have Name (control name), EventName, and Action.

```yaml
Type: Hashtable[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -title
The window title

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

### -HideLabels
Use this switch if you want no labels at all (no column for them, even)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -property
A hashtable of properties to set on the window

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowGridLines
Switch to say whether to show grid lines in all grids (for layout debugging)

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ShowForValue
Switch to say whether you want the window immediately shown (showdialog()) and if OK pressed
to output the "calculated output of the window". 
Window with -ShowForValue works similarly to 
Dialog function but doesn't automatically add Ok and Cancel button.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
