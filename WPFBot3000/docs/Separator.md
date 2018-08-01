---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Separator

## SYNOPSIS
A Separator control

## SYNTAX

```
Separator [[-property] <Hashtable>] [<CommonParameters>]
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
            MenuItem Item1 -action {write-host "item1"}
            MenuItem Item2 -action {write-host "item2"}
            Separator 
            MenuItem Item3 -action {write-host "item3"}
            }
        }
    }
}

## PARAMETERS

### -property
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
General notes

## RELATED LINKS
