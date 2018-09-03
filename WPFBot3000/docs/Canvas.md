---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.canvas
schema: 2.0.0
---

# Canvas

## SYNOPSIS
A canvas control

## SYNTAX

```
Canvas [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
A canvas control that contains other controls which can be positioned with absolute coordinates using Canvas.Top/Left attached properties

## EXAMPLES

### EXAMPLE 1
```
Window {
```

Canvas {
       CheckBox Eeny -property @{'Canvas.Left'=50}
       CheckBox Meeny  -property @{'Canvas.Left'=50; 'Canvas.Top'=50}
       CheckBox Miny -property @{'Canvas.Left'=50; 'Canvas.Top'=50}
    } -property @{Width=400;Height=400}
} -ShowForValue

## PARAMETERS

### -Contents
A scriptblock that outputs controls you want in this canvas

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

### -Name
The name of the canvas control

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

[https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.canvas](https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.canvas)

