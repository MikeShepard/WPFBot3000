---
external help file: wpf_dsl-help.xml
Module Name: wpf_dsl
online version:
schema: 2.0.0
---

# CheckBox

## SYNOPSIS
Outputs a checkbox control

## SYNTAX

```
CheckBox [[-Name] <Object>] [[-InitialValue] <Boolean>] [[-property] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Outputs a checkbox control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

## EXAMPLES

### EXAMPLE 1
```
Import-Module wpf_dsl -force

Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}
```
In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny.

## PARAMETERS

### -Name
The name of the control.  This will be the name of a property in the output of the Dialog function.

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

### -InitialValue
True means checked, False means not checked

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -property
Property values for the control.

```yaml
Type: Object
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
This command does not accept pipeline input.

## OUTPUTS
This command outputs a checkbox control.

## NOTES


## RELATED LINKS
