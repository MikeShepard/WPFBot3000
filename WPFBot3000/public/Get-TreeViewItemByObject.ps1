function Get-TreeViewItemByObject{
    [CmdletBinding()]
    Param($treeView,
          $fromNode,
          $object)
    if(-not $fromNode){
        $FromNode=$treeview 
    }
    foreach($item in $FromNode.Items){
        if($item.Tag -eq $object){
            return $item
        } else {
            if($item.Items.Count -gt 0){
                $foundItem=Get-TreeViewItemByObject $treeView $item $object
                if ($foundItem){
                    return $foundItem
                }
            }
        }
    }
}

function Get-TreeViewItemByLabel{
    [CmdletBinding()]
    Param($treeView,
          $fromNode,
          $label)
    if(-not $fromNode){
        $FromNode=$treeview 
    }
    foreach($item in $FromNode.Items){
        if($item.Header -eq $label){
            return $item
        } else {
            if($item.Items.Count -gt 0){
                $foundItem=Get-TreeViewItemByObject $treeView $item $object
                if ($foundItem){
                    return $foundItem
                }
            }
        }
    }
}