<#
.SYNOPSIS
Adds a context menu to a given control.Short description

.DESCRIPTION
Uses the hashtable (form -> MenuItemName={action}) to create a context menu for the given control.  For convenience, the menu item's tag is set to the control.
You can get to the control in the action (i.e. event handler) using $this.Tag.

.PARAMETER Control
The control that gets the context menu

.PARAMETER Items
Hashtable.  The keys in the hashtable will be the labels of the context menu items.  The corresponding values should be scriptblocks that will be invoked if the menu item is clicked.

.EXAMPLE
An example

.NOTES
General notes
#>
function Add-WPFMenu{
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline=$true)]$Control,
          [Hashtable]$Items)
process{
    $contextMenu=New-Object System.Windows.Controls.ContextMenu
    foreach($item in $items.GetEnumerator()){
                $menuItem=new-object System.Windows.Controls.MenuItem -property @{Header=$item.Key}
                $menuItem.Tag=$control
                $menuItem.Add_Click($item.Value)
                $contextMenu.Items.Add($menuItem) | out-null
    }
    $control.ContextMenu=$contextMenu
    $control
}
}