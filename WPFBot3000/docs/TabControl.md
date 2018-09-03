---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.tabcontrol
schema: 2.0.0
---

# TabControl

## SYNOPSIS
A TabControl (container for tabs) that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TabControl class

## SYNTAX

```
TabControl [[-Name] <String>] [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A TabControl (container for tabs)

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

TabControl Tabs {
        TabItem Before { TextBox Description -prop @{MinWidth=100;MinHeight=100} }
        TabItem After { TextBox Description2 -prop @{MinWidth=100;MinHeight=100}}
    }
}

## PARAMETERS

### -Name
The name of the TabControl

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

### -Contents
A scriptblock that outputs tabitem controls to embed in the TabControl

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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.tabcontrol](https://msdn.microsoft.com/en-us/library/system.windows.controls.tabcontrol)

