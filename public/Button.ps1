
function Button {
    [CmdletBinding()]
    Param($Caption, [ScriptBlock]$Action, $property = @{},$name)
    $baseProperties = @{
        Content = $Caption
    }
    if($name){
      $baseProperties.Name=$name
    }
    $properties = Merge-HashTable $baseProperties $property
    $btn = new-object System.Windows.Controls.Button -Property $properties
    $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $btn.Add_Click($action)
    $btn
}