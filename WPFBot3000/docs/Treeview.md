---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version:
schema: 2.0.0
---

# Treeview

## SYNOPSIS
A TreeView control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TreeView class

## SYNTAX

```
Treeview [[-name] <String>] [[-property] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
A TreeView control

## EXAMPLES

### EXAMPLE 1
```
Dialog{
```

TreeView Tree
    Button Load -Action {
        $tree.AddTreeViewItem($null,@( 'A','B','C' ))
        $tree.AddTreeViewItem('A',@('A1','A2'))
    }
}

## PARAMETERS

### -name
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

[General notes	https://msdn.microsoft.com/en-us/library/system.windows.controls.treeview]()

