---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# StackPanel

## SYNOPSIS
A stackpanel control

## SYNTAX

```
StackPanel [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Orientation] <Object>] [[-name] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
A stackpanel control that contains other controls

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}

## PARAMETERS

### -Contents
A scriptblock that outputs controls you want in this stackpanel

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
Properties to extend/override the base properties defined in the function

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

### -Orientation
Horizontal or vertical (how it "stacks" the controls)

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Horizontal
Accept pipeline input: False
Accept wildcard characters: False
```

### -name
The name of the stackpanel control

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
