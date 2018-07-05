<#
.SYNOPSIS
A label control

.DESCRIPTION
A label control

.PARAMETER Text
the text of the label

.PARAMETER name
The name of the control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Import-Module WPFBot3000 -force
$w=Window {
    Textbox Name
    Button Personalize -name mike -action {
                                 $txt=$this.Window.GetControlByName('Name')
                                 $lbl=$this.Window.GetControlByName('Greeting')
                                 $lbl.Content="Hello, $($txt.Text)"}
    Label 'Hello, World' -name 'Greeting'
}
$w.ShowDialog()


.NOTES
General notes
#>
function Label {
    [CmdletBinding()]
    Param([string]$Text,
          [string]$name,
          [hashtable]$property = @{})

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