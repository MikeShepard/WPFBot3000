<#
.SYNOPSIS
A ComboBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ComboBox class

.DESCRIPTION
Outputs a ComboBox control with a given set of contents and optionally a selected value.

.PARAMETER Name
The name of the control.  This will be the name of a property of the output of the Dialog function.

.PARAMETER Contents
A list of items to fill the ComboBox.

.PARAMETER InitialValue
The item from $Contents that is initially selected.

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  ComboBox Guess -Contents 'a','b','c' -InitialValue 'b'

} -Property @{ Title = 'ComboBox'; MinHeight = 233; MinWidth = 377; }

# A Dialog box with ComboBox having 3 choices, the second is selected.

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox
#>
function ComboBox {
  [CmdletBinding()]
  Param([string]$Name,
    [Array]$Contents,
    $InitialValue,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name = $name
  }
  $l = New-WPFControl -type System.Windows.Controls.Combobox -Properties $baseProperties, $property

  if ($initialValue) {
    $l.SelectedItem = $initialValue
  }

  $contents | ForEach-Object {$l.Items.Add($_) | out-null }
  $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}