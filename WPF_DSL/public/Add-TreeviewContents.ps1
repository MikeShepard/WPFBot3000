<#
.SYNOPSIS
Adds items from a hashtable to the treeview.

.DESCRIPTION
Adds items from a hashtable to the treeview.

.PARAMETER parent
The node in the tree to add the items to

.PARAMETER items
The items to add to the tree

.EXAMPLE
An example

.NOTES
General notes - Needs to be refactored/rewritten
#>
function Add-TreeviewContents {
    [CmdletBinding()]
    Param($parent, $items)
    foreach ($item in $items) {
        if ($item -is [Hashtable]) {
            foreach ($h in ([hashtable]$item).GetEnumerator()) {
                $node = New-object System.Windows.Controls.TreeViewItem -Property @{Header = $h.Name}
                $Node.Tag = $h.Name
                [void]$parent.Items.Add($node)
                Add-TreeViewContents -parent $Node -items $h.Value
                $node.ExpandSubtree()
            }
        }
        else {
            $node = New-object System.Windows.Controls.TreeViewItem -Property @{Header = $item.ToString()}
            $node.Tag = $item
            $parent.Items.Add($node) | out-null
        }
    }

}