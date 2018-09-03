---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.statusbar
schema: 2.0.0
---

# StatusBar

## SYNOPSIS
A StatusBar control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Primitives.StatusBar class

## SYNTAX

```
StatusBar [[-Contents] <ScriptBlock>] [[-Property] <Hashtable>] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
A StatusBar control that contains other controls

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

DockPanel {
        StatusBar -Name Status {
            Label Status
        } -Property @{ 'DockPanel.Dock' = 'Bottom' }
        Label Right Property @{ 'DockPanel.Dock' = 'Right' }
        Label Top -Property @{ 'DockPanel.Dock' = 'Top' }
        Label Left -Property @{ 'DockPanel.Dock' = 'Left' }
        Label Center -Property @{ HorizontalAlignment = 'Center'; VerticalAlignment = 'Center'; }
    } -Name DockPanel -Property @{ Height = 233 }
} -Property @{ Title = 'StatusBar' }

## PARAMETERS

### -Contents
A scriptblock that outputs controls you want in this StatusBar

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

### -Name
The name of the StatusBar control

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.statusbar](https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.statusbar)

