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
# No example required, the body of this function is used as a scriptmethod on TreeViews

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