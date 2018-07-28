<#
.SYNOPSIS
A treeview control

.DESCRIPTION
A treeview control

.PARAMETER name
The name of the control

.PARAMETER contents
The contents of the control (hashtable...may be refactored)

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
TBD

.NOTES
General notes
#>
function Treeview {
    [CmdletBinding()]
    Param([string]$name,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $tree=New-WPFControl -type System.Windows.Controls.TreeView -Properties $baseProperties,$property

    $tree | add-member -Name AddTreeViewItem -membertype ScriptMethod -value ${function:Add-TreeViewItem}
    $tree | add-member -Name GetTreeViewItemByLabel -membertype ScriptMethod -value ${function:Get-TreeViewItemByLabel}
    $tree | add-member -Name GetTreeViewItemByObject -membertype ScriptMethod -value ${function:Get-TreeViewItemByObject}
    $tree | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
        if($item -is [System.Windows.Controls.TreeViewItem] -and $item.Tag){
            $item.Tag
        } else {
            $item
        }} -PassThru
}