---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://docs.microsoft.com/en-us/dotnet/api/system.windows.window
schema: 2.0.0
---

# WrapPanel

## SYNOPSIS
A WrapPanel control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.WrapPanel class

## SYNTAX

```
WrapPanel [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Orientation] <Object>] [[-Name] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Outputs a WPF WrapPanel control, along with control(s) contained in it

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

WrapPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}

## PARAMETERS

### -Contents
A scriptblock that outputs controls you want in this WrapPanel

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

### -Name
The name of the WrapPanel control

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
