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
          [scriptblock]$contents,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property

    $tree = new-object System.Windows.Controls.TreeView -Property $properties

    Add-TreeviewContents -parent $tree -items $contents
    $tree | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
        if($item -is [listboxitem] -and $item.Tag){
            $item.Tag
        } else {
            $item
        }} -PassThru
}