---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.checkbox
schema: 2.0.0
---

# CheckBox

## SYNOPSIS
A CheckBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.CheckBox class

## SYNTAX

```
CheckBox [[-Name] <String>] [[-InitialValue] <Boolean>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Outputs a checkbox control. 
Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny -InitialValue $true
       CheckBox Miny
    }
    TextBox Moe
} -Property @{ Title = 'CheckBox' }
\`\`\`
In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny.

## PARAMETERS

### -Name
The name of the control. 
This will be the name of a property in the output of the Dialog function.

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

[https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.checkbox](https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.checkbox)

