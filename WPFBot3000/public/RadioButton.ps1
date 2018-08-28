<#
.SYNOPSIS
A RadioButton control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.RadioButton class

.DESCRIPTION
Outputs a radiobutton control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

.PARAMETER Name
The name of the control.  This will be the name of a property in the output of the Dialog function

.PARAMETER InitialValue
True means checked, False means not checked

.PARAMETER GroupName
The group that the radio button belongs to

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  RadioButton Eeny -GroupName Options
  RadioButton Meeny -InitialValue $true -GroupName Options
  RadioButton Miny  -GroupName Options

  TextBox Moe
} -Property @{ Title = 'RadioButton'; MinHeight = 233; MinWidth = 377; }
```
In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny.

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.radiobutton
#>
function RadioButton {
  [CmdletBinding()]
  Param([string]$Name,
    [Boolean]$InitialValue = $false,
    [string]$GroupName,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name      = $name
    Content   = $Name
    GroupName = $GroupName
    IsChecked = $InitialValue
  }

  $chk = New-WPFControl -type System.Windows.Controls.RadioButton -Properties $baseProperties, $property

  $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked}
  $chk | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}