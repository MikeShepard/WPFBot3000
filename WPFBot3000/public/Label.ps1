<#
.SYNOPSIS
A Label control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Label class

.DESCRIPTION
A Label control

.PARAMETER Text
the text of the label

.PARAMETER Name
The name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Import-Module WPFBot3000 -force
$w=Window {
    Textbox Name -Property @{ MinWidth=50}
    Button Personalize -Action {
                                 $Greeting.Content="Hello, $($Name.Text)"}
    Label 'Hello, World' -name 'Greeting'
} -ShowForValue


.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.label
#>
function Label {
    [CmdletBinding()]
    Param([string]$Text,
        [string]$Name,
        [hashtable]$Property = @{})

    $BaseProperties = @{
        Content = $text
    }
    if ($Name) {
        $BaseProperties.Name = $Name
    }

    $label = New-WPFControl -type System.Windows.Controls.Label -Properties $baseProperties, $Property
    $label  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}