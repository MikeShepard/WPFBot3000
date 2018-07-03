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