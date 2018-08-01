---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Border

## SYNOPSIS
A border control

## SYNTAX

```
Border [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Outputs a border control, along with control(s) contained in it. 
If more than one control is in $Contents, a stackpanel is inserted (because borders only have one child)

## EXAMPLES

### EXAMPLE 1
```
dialog {
```

Border  {
        TextBox Fred -property @{MinWidth=50}
        TextBox Barney
    } -property @{BorderBrush='Red';BorderThickness=5} -name Flintstones
}

## PARAMETERS

### -Contents
The control(s) contained in the border

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
Additional properties to be set on the border.

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

### -name
The name of the border control. 
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
General notes

## RELATED LINKS
