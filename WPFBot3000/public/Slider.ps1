<#
.SYNOPSIS
A Slider control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Slider class

.DESCRIPTION
A Slider control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The value to set the slider to

.PARAMETER MinimumValue
The max value of the slider

.PARAMETER MaximumValue
The max value of the slider

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  Slider Rating -Min 0 -Max 10 -Initial 5 |
    HandlesEvent ValueChanged { $SliderValue.Content = $Rating.Value }

  Label -Name SliderValue

} -Property @{ Title = 'Slider'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.slider
#>
function Slider {
  [CmdletBinding()]
  Param([string]$Name,
    [Int]$InitialValue = 0,
    [Int]$MinimumValue = 0,
    [Int]$MaximumValue = 100,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name    = $name
    Value   = $InitialValue
    Minimum = $MinimumValue
    Maximum = $MaximumValue
  }

  $o = New-WPFControl -type System.Windows.Controls.Slider -Properties $baseProperties, $property
  $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Value} -PassThru
}