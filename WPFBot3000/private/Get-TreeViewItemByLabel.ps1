<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER treeView
Parameter description

.PARAMETER fromNode
Parameter description

.PARAMETER label
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Get-TreeViewItemByLabel{
    [CmdletBinding()]
    Param($fromNode,
          $label)
    if(-not $fromNode){
        $FromNode=$this 
    }
    foreach($item in $FromNode.Items){
        if($item.Header -eq $label){
            return $item
        } else {
            if($item.Items.Count -gt 0){
                $foundItem=$this.GetTreeViewItemByLabel($item, $label)
                if ($foundItem){
                    return $foundItem
                }
            }
        }
    }
}