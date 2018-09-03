---
external help file: WPFBot3000-help.xml
Module Name: wpfbot3000
online version: https://msdn.microsoft.com/en-us/library/system.windows.controls.menuitem
schema: 2.0.0
---

# MenuItem

## SYNOPSIS
A MenuItem control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.MenuItem class

## SYNTAX

```
MenuItem [[-Label] <String>] [[-Action] <ScriptBlock>] [[-Property] <Hashtable>] [[-Name] <String>]
 [[-Contents] <ScriptBlock>] [<CommonParameters>]
```

## DESCRIPTION
A MenuItem control

## EXAMPLES

### EXAMPLE 1
```
#note that the menu here is not lined up well...see menu.ps1 in the examples folder (includes a dockpanel)
```

Dialog {
    Menu Menus {
        MenuItem TopLevel -contents{
            MenuItem Increment -action { $value.Text=1+$Value.Text}
            MenuItem Decrement -action { $value.Text=-1+$Value.Text}
        }
    }
    Textbox Value -initialValue 100
} -showgridlines

## PARAMETERS

### -Label
The label of the MenuItem

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

### -Action
The action to be performed when clicking this menu item

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

### -Property
Properties to extend/override the base properties defined in the function

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the control

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Contents
Other MenuItem controls that are nested under this

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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

[https://msdn.microsoft.com/en-us/library/system.windows.controls.menuitem](https://msdn.microsoft.com/en-us/library/system.windows.controls.menuitem)

