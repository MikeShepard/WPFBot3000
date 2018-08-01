---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# TabItem

## SYNOPSIS
A tabitem control (A tab in a TabControl)

## SYNTAX

```
TabItem [[-label] <String>] [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-name] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
A tabitem control (A tab in a TabControl)

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

### -label
The label of the tab

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
A scriptblock that outputs controls you want in the tab

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

### -name
The name of the control

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
