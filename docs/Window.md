---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# Window

## SYNOPSIS
Creates a window object with the controls from $Contents

## SYNTAX

```
Window [[-Contents] <ScriptBlock>] [[-labelMap] <Hashtable>] [[-Events] <Hashtable[]>] [[-title] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a window object with the controls from $Contents.  Associates events with controls using $Events hashtable (See examples).
Optionally sets title and allows for alternate labels for controls.

## EXAMPLES

### EXAMPLE 1
```
$w=Window {
        TextBox Fred
        CheckBox Barney
}

Output
A window with 2 controls

### EXAMPLE 2
```
$w=Window {
        TextBox Fred
        CheckBox Barney
} -labelmap @{Fred='First Textbox'}

Output
A same window as in example 1, but textbox is now labled "First textbox" instead of "Fred".
```

## PARAMETERS

### -Contents
The controls found in the window.  A scriptblock containing commands that output controls (from WPF_DSL primarily, but you can emit your own WPF controls if you'd like)

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
A hashtable containing alternate text to label controls.  An item in the hashtable should be in the form ControlName='Desired label'.  Controls not found in the label map will get labeled with the control name (except for checkboxes and labels, which don't get labels)

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
An array of hashtables with elements Name (control name), EventName, and Action (a scriptblock).  The action will be registered as an event handler for eventName on the control named Name.

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
An optional title for the window

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
The command does not receive pipeline input.
## OUTPUTS
System.Windows.Window
## NOTES


## RELATED LINKS
[Dialog]()

[FindChild]()