function Label {
    [CmdletBinding()]
    Param($Text, $name, $property = @{})

    $BaseProperties=@{
        Content = $text
    }

    $properties = Merge-HashTable $baseProperties $property

    $label = new-object System.Windows.Controls.Label -Property $properties
    if ($name) {
        $label.Name = $name
    }
    $label  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}