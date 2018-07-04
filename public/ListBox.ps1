function ListBox {
    [CmdletBinding()]
    Param([string]$name,
          [Array]$contents = @(),
          $initialValue,
          [Hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property

    $l = new-object System.Windows.Controls.ListBox -Property $properties
    if ($Contents) {
        $contents | ForEach-Object {
            $lvi = new-object System.Windows.Controls.ListBoxItem
            $lvi.Tag = $_
            $lvi.Content = $_.ToString()
            $l.Items.Add($lvi) | out-null
            if ($initialValue -and $_ -eq $initialValue) {
                $l.SelectedItem = $lvi
            }
        }
    }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
                                                                           if($item -is [listboxitem] -and $item.Tag){
                                                                               $item.Tag
                                                                           } else {
                                                                               $item
                                                                           }} -PassThru
}
