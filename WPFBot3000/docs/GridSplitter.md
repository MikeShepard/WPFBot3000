---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.gridsplitter
schema: 2.0.0
---

# GridSplitter

## SYNOPSIS
A GridSplitter control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.GridSplitter class

## SYNTAX

```
GridSplitter [[-Orientation] <Object>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Allows the user to resize rows/columns of a grid.

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Grid -ColumnCount 3 {

    GridSplitter -Orientation Vertical -Property @{ 'Grid.Row' = 1 }
    GridSplitter -Orientation Vertical -Property @{ 'Grid.Row' = 2 }
     1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}
   } -Property @{ ShowGridlines = $true }
     
} -Property @{ Title = 'GridSplitter'

## PARAMETERS

### -Orientation
Horizontal/Vertical

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Horizontal
Accept pipeline input: False
Accept wildcard characters: False
```

### -property
Properties to extend/override the base properties defined in the function

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.gridsplitter](https://msdn.microsoft.com/en-us/library/system.windows.controls.gridsplitter)

