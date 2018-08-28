<#
.SYNOPSIS
A Label control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Label class

.DESCRIPTION
A Label control

.PARAMETER Text
The text of the label

.PARAMETER Name
The name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
  Textbox Name
  Button Personalize -Name mike |
    HandlesEvent Click {
      $txt = $this.Window.GetControlByName('Name')
      $lbl = $this.Window.GetControlByName('Greeting')
      $lbl.Content = "Hello, $($txt.Text)"
    }

  Label 'Hello, World' -Name 'Greeting'

} -Property @{ Title = 'Label'; MinHeight = 233; MinWidth = 377; }

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
  if ($name) {
    $BaseProperties.Name = $name
  }

  $label = New-WPFControl -type System.Windows.Controls.Label -Properties $baseProperties, $property
  $label  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}