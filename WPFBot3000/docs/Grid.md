---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Grid

## SYNOPSIS
A grid panel, which displays its contents in rows and columns

## SYNTAX

```
Grid [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-name] <String>] [[-ColumnCount] <Int32>]
 [[-RowCount] <Int32>] [-Manual] [<CommonParameters>]
```

## DESCRIPTION
A grid panel, which displays its contents in rows and columns

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

Grid -columnCount 3   {
        1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}
      } -Property @{ShowGridlines=$true}
   }

## PARAMETERS

### -Contents
A scriptblock that outputs controls that you want in the grid

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

### -name
The name of the grid control. 
This name will be a property in the output of the dialog function

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

### -ColumnCount
The number of columns in the grid. 
The number of rows is determined by the number of controls in $Contents.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 1
Accept pipeline input: False
Accept wildcard characters: False
```

### -RowCount
The number of rows in the grid. 
Required if -Manual is specified

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Manual
Specifies that you want to place controls in rows/columns manually (Using Grid.Row/Grid.Column properties)

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
General notes

## RELATED LINKS
