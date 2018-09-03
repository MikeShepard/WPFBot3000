---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.groupbox
schema: 2.0.0
---

# GroupBox

## SYNOPSIS
A GroupBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.GroupBox class

## SYNTAX

```
GroupBox [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Title] <String>] [[-Name] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a GroupBox control, along with control(s) contained in it. 
If more than one control is in $Contents, a stackpanel is inserted (because groupboxes only have one child)

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Groupbox  {
        TextBox Fred -property @{MinWidth = 50}
        TextBox Barney -property @{MinWidth = 50}
    } -property     @{BorderBrush = 'Red' ;BorderThickness = 5} -Name Flintstones
}

## PARAMETERS

### -Contents
The control(s) contained in the GroupBox

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
Additional properties to be set on the GroupBox.

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

### -Title
The title of the GroupBox control.

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

### -Name
The name of the GroupBox control. 
The name will be used as a property name in the output of the Dialog function.

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

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.groupbox](https://msdn.microsoft.com/en-us/library/system.windows.controls.groupbox)

