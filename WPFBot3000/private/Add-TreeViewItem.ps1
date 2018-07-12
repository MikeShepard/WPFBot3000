<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER treeview
Parameter description

.PARAMETER parent
Parameter description

.PARAMETER items
Parameter description

.PARAMETER nameProperty
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Add-TreeviewItem {
    [CmdletBinding()]
    Param($parent,
        $items,
        $nameProperty=$null)

    #find parent in Treeview (label or object)
    if ($parent) {
        if ($parent -is [String]) {
            $parentNode = $this.GetTreeViewItemByLabel($null,$parent)
        } else {
            $parentNode = $this.GetTreeViewItemByObject($null,$parent)
        }
        if (-not $parentNode ) {
            throw "ParentNode ($parent) not found"
        }
    } else {
        $parentnode = $this
    }
    foreach ($item in $items) {
        if ($nameProperty) {
            $name = $item.$nameProperty
        } else {
            $name = $item.ToString()
        }
        $node = New-object System.Windows.Controls.TreeViewItem -Property @{Header = $Name}
        $node.Tag = $item
        $parentNode.Items.Add($node) | out-null
    }
}