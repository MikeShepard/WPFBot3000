
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER name
Parameter description

.PARAMETER contents
Parameter description

.PARAMETER initialValue
Parameter description

.PARAMETER property
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Treeview {
    [CmdletBinding()]
    Param($name, $contents, $initialValue, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property

    $tree = new-object System.Windows.Controls.TreeView -Property $properties

    Add-TreeviewContents -parent $tree -items $contents
    $tree | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}