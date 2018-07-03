---
external help file: wpf_dsl-help.xml
Module Name: WPF_DSL
online version:
schema: 2.0.0
---

# Add-WPFMenu

## SYNOPSIS
Adds a context menu to a given control.

## SYNTAX

```
Add-WPFMenu [[-Control] <Object>] [[-Items] <Hashtable>] [<CommonParameters>]
```

## DESCRIPTION
Uses the hashtable (form -> MenuItemName={action}) to create a context menu for the given control.  For convenience, the menu item's tag is set to the control.
You can get to the control in the action (i.e. event handler) using $this.Tag.

## EXAMPLES

### Example 1
```powershell
PS C:\> dialog {
textbox Fred 'Hello' | Add-WPFMenu -items @{UpperCase={
    $txtBox=$this.tag;$txtBox.Text=$txtBox.Text.ToUpper()}}
 }
```

Adds a context menu to the text box with a single item (UpperCase) that when clicked converts the textbox contents to upper case.

## PARAMETERS

### -Control
The control that the context menu will be attached to.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Items
Hashtable.  The keys in the hashtable will be the labels of the context menu items.  The corresponding values should be scriptblocks that will be invoked if the menu item is clicked.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
This command does not accept pipeline input

## OUTPUTS

### System.Windows.Controls.Control
This command outputs the passed in $control parameter.

## NOTES

## RELATED LINKS
