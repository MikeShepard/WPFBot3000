---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle
schema: 2.0.0
---

# Rectangle

## SYNOPSIS
A Rectangle control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Shapes.Rectangle class

## SYNTAX

```
Rectangle [[-Height] <Object>] [[-Width] <Object>] [[-Name] <String>] [[-Property] <Hashtable>]
 [<CommonParameters>]
```

## DESCRIPTION
A Rectangle control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

TextBox FirstName
    Rectangle -Height 100 -Width 100 -property @{Stroke=\[System.Windows.Media.Brushes\]::Black}
}

## PARAMETERS

### -Height
The height of the rectangle

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

### -Width
The Width of the rectangle

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

### -Name
The Name of the rectangle control

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

### -Property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
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

[https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle](https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle)

