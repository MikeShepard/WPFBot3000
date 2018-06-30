<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Text
Parameter description

.PARAMETER name
Parameter description

.PARAMETER property
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
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