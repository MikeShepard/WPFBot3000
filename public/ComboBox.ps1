function ComboBox {
    [CmdletBinding()]
    Param($name, $contents, $initialValue, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $l = new-object System.Windows.Controls.ComboBox -Property $properties
    if ($initialValue) {
        $l.SelectedItem = $initialValue
    }

    $contents | ForEach-Object {$l.Items.Add($_) | out-null }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}