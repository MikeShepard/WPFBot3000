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
    $label
}