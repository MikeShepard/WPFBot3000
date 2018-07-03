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
    $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
        if($item -is [listboxitem] -and $item.Tag){
            $item.Tag
        } else {
            $item
        }} -PassThru
}