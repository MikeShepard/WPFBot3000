---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.dockpanel
schema: 2.0.0
---

# DockPanel

## SYNOPSIS
A DockPanel control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DockPanel class

## SYNTAX

```
DockPanel [[-Contents] <ScriptBlock>] [[-Name] <Object>] [[-Property] <Object>] [<CommonParameters>]
```

## DESCRIPTION
A DockPanel control

## EXAMPLES

### EXAMPLE 1
```
Dialog {
```

DockPanel {Label Bottom -Property @{ 'DockPanel.Dock' = 'Bottom'; background = 'Yellow' }
            Label Right -Property @{ 'DockPanel.Dock' = 'Right'; background = 'Red' }
            Label Top -Property @{ 'DockPanel.Dock' = 'Top'; background = 'Green' }
            Label Left -Property @{ 'DockPanel.Dock' = 'Left'; background = 'Blue' }
            Label Center -property @{ HorizontalAlignment='Center'; VerticalAlignment='Center'; }
  } -Name SampleDockPanel -Property @{ Height = 233; }
 } -Property @{ Title = 'DockPanel'; MinHeight = 377; MinWidth = 377; }

## PARAMETERS

### -Contents
The control(s) contained in the DockPanel

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

### -Name
The name of the DockPanel control

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Property
Additional properties to be set on the DockPanel

```yaml
Type: Object
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.dockpanel](https://msdn.microsoft.com/en-us/library/system.windows.controls.dockpanel)

