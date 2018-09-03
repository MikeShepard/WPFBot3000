---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.datagrid
schema: 2.0.0
---

# DataGrid

## SYNOPSIS
A DataGrid control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DataGrid class

## SYNTAX

```
DataGrid [[-Name] <String>] [[-contents] <Array>] [[-initialValue] <Object>] [[-property] <Hashtable>]
 [<CommonParameters>]
```

## DESCRIPTION
A DataGrid control

## EXAMPLES

### EXAMPLE 1
```
$files=get-childitem c:\windows -file | select-object -first 10
```

Dialog {
    DataGrid Files -contents $files -property @{MaxWidth=600;MaxHeight=400;IsReadOnly=$true}
} -Property @{ Title = 'DataGrid' }

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

### -contents
The contents of the DataGrid

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

### -initialValue
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

### -property
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.datagrid](https://msdn.microsoft.com/en-us/library/system.windows.controls.datagrid)

