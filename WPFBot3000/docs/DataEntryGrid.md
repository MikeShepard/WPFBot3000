---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# DataEntryGrid

## SYNOPSIS
Two-column data entry grid, labels in first column, controls in second column

## SYNTAX

```
DataEntryGrid [[-Name] <Object>] [[-Contents] <ScriptBlock>] [[-property] <Hashtable>] [-HideLabels]
 [<CommonParameters>]
```

## DESCRIPTION
Two-column data entry grid, labels in first column, controls in second column

## EXAMPLES

### EXAMPLE 1
```
dialog {
```

TabControl -name Top {
        TabItem Fred  {
            DataEntryGrid -name Tab1 {
                TextBox ABC
                TextBox DEF
            }
        }
        TabItem Barney {
            listbox -contents (dir c:\temp | select -first 10) -name Barney2
        }
        TabItem Wilma {
            listbox -contents (dir c:\temp | select -first 10) -name Wilma2
        }
        TabItem Betty {
            listbox -contents (dir c:\temp | select -first 10) -name Betty2
        }
    }
}

## PARAMETERS

### -Name
The name of the control

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

### -Contents
The controls that are contained in the data entry grid

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

### -property
A hashtable of properties to be set on the control

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -HideLabels
Switch to say whether all labels are hidden

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
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
