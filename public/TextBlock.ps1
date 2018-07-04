function TextBlock {
    [CmdletBinding()]
    Param([string]$Text,
          [string]$name,
          [hashtable]$property = @{})

    $BaseProperties=@{
        Content = $text
    }

    $properties = Merge-HashTable $baseProperties $property

    $textblock = new-object System.Windows.Controls.TextBlock -Property $properties
    if ($name) {
        $textblock.Name = $name
    }
    $textblock | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $textblock | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}