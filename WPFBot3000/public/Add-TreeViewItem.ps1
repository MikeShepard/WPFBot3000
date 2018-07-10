function Add-TreeviewItem {
    [CmdletBinding()]
    Param($treeview,
        $parent, 
        $items,
        $nameProperty)
   
    #find parent in Treeview (label or object)
    if ($parent) {
        if ($parent -is [String]) {
            $parentNode = Get-TreeViewItemByLabel -treeView $TreeView -label $parent
        } else {
            $parentNode = Get-TreeViewItemByObject -treeview $TreeView -object $parent 
        }
        if (-not $parentNode ) {
            throw "ParentNode ($parent) not found"
        }
    } else {
        $parentnode = $treeview
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