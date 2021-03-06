---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.slider
schema: 2.0.0
---

# Slider

## SYNOPSIS
A Slider control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Slider class

## SYNTAX

```
Slider [[-Name] <String>] [[-InitialValue] <Int32>] [[-MinimumValue] <Int32>] [[-MaximumValue] <Int32>]
 [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Slider control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Slider Rating -Min 0 -Max 10 -Initial 5 | 
       HandlesEvent ValueChanged {$SliderValue.Content=$Rating.Value}
    Label -Name SliderValue
 }

## PARAMETERS

### -Name
The name of the control

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

### -InitialValue
The value to set the slider to

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinimumValue
The max value of the slider

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaximumValue
The max value of the slider

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 100
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
Position: 5
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.slider](https://msdn.microsoft.com/en-us/library/system.windows.controls.slider)

