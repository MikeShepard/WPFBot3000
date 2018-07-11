<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER treeView
Parameter description

.PARAMETER fromNode
Parameter description

.PARAMETER object
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Get-TreeViewItemByObject{
    [CmdletBinding()]
    Param($fromNode,
          $object)
    if(-not $fromNode){
        $FromNode=$this 
    }
    foreach($item in $FromNode.Items){
        if($item.Tag -eq $object){
            return $item
        } else {
            if($item.Items.Count -gt 0){
                $foundItem=$this.GetTreeViewItemByObject($item, $object)
                if ($foundItem){
                    return $foundItem
                }
            }
        }
    }
}

