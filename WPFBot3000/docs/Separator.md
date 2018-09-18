---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.separator
schema: 2.0.0
---

# Separator

## SYNOPSIS
A Separator control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Separator class

## SYNTAX

```
Separator [[-Property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A Separator control

## EXAMPLES

### EXAMPLE 1
```
Dialog{
```

DockPanel{
        Menu -contents {
            MenuItem Menu5 -Contents {
            MenuItem Item1 -action {Write-Host "item1"}
            MenuItem Item2 -action {Write-Host "item2"}
            Separator 
            MenuItem Item3 -action {Write-Host "item3"}
            }
        }
    }
}

## PARAMETERS

### -Property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.separator](https://msdn.microsoft.com/en-us/library/system.windows.controls.separator)

