---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.menu
schema: 2.0.0
---

# Menu

## SYNOPSIS
A Menu control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Menu class

## SYNTAX

```
Menu [[-Name] <String>] [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Menu control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Menu Menus {
      MenuItem TopLevel -Contents {
      MenuItem Increment |
        HandlesEvent Click {
            $value.Text = 1 + $Value.Text
        }
       MenuItem Decrement |
        HandlesEvent Click {
            $value.Text = 1 - $Value.Text
        }
    }
    TextBox Value -InitialValue 100
}

## PARAMETERS

### -Name
The name of the Menu

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
A scriptblock that outputs MenuItem controls to embed in the Menu

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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.menu](https://msdn.microsoft.com/en-us/library/system.windows.controls.menu)

