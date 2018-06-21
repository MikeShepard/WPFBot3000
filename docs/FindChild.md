---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# FindChild

## SYNOPSIS
Find a control in a WPF window

## SYNTAX

```
FindChild [[-parent] <Object>] [[-childName] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Unlike FindName(), FindChild actually works with dynamically created controls. 
It walks the
visual control tree to find all of the controls in the window, returning the first one that
has the right name.

## EXAMPLES

### EXAMPLE 1
```
$w=Window {
```

StackPanel {
        TextBox Fred
        CheckBox Barney
    }
}

FindChild -Parent $w -childName Barney

Output
\<The "Barney checkbox control\>

## PARAMETERS

### -parent
A wpf control that contains other controls (generally a window or page)

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

### -childName
The name of the control to find

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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

## RELATED LINKS
