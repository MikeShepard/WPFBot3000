function TextBlock {
    [CmdletBinding()]
    Param($Text, $name, $property = @{})

    $BaseProperties=@{
        Content = $text
    }

    $properties = Merge-HashTable $baseProperties $property

    $textblock = new-object System.Windows.Controls.TextBlock -Property $properties
    if ($name) {
        $textblock.Name = $name
    }
    $textblock | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}