---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.scrollviewer
schema: 2.0.0
---

# ScrollViewer

## SYNOPSIS
A ScrollViewer control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ScrollViewer class

## SYNTAX

```
ScrollViewer [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Outputs a ScrollViewer control, along with control(s) contained in it. 
If more than one control is in $Contents, a StackPanel is inserted (because ScrollViewers only have one child)

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

ScrollViewer  {
        TextBox Fred -property @{MinWidth=50}
        TextBox Barney
    } -Property @{ScrollViewerBrush='Red';ScrollViewerThickness=5} -name Flintstones
}

## PARAMETERS

### -Contents
The control(s) contained in the ScrollViewer

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

### -Property
Additional properties to be set on the ScrollViewer.

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

### -Name
The name of the ScrollViewer control. 
The name will be used as a property name in the output of the Dialog function.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.scrollviewer](https://msdn.microsoft.com/en-us/library/system.windows.controls.scrollviewer)

