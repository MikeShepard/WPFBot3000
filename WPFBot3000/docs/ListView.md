---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.listview
schema: 2.0.0
---

# ListView

## SYNOPSIS
A ListView control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ListView class

## SYNTAX

```
ListView [[-Name] <String>] [[-Contents] <Array>] [[-InitialValue] <Object>] [[-Property] <Hashtable>]
 [[-DisplayProperty] <Array>] [-MultiSelect] [<CommonParameters>]
```

## DESCRIPTION
A ListView control

## EXAMPLES

### EXAMPLE 1
```
$files=get-childitem c:\windows -file | select-object -first 10
```

Dialog {
    ListView Files -contents $files
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

### -Contents
The contents of the ListView

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -InitialValue
The item from $contents that is initally selected

```yaml
Type: Object
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
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayProperty
Properties that get turned into columns in the ListView

```yaml
Type: Array
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MultiSelect
Sets the selectionMode of the listbox to "Extended"

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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.listview](https://msdn.microsoft.com/en-us/library/system.windows.controls.listview)

