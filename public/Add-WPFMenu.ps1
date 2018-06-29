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