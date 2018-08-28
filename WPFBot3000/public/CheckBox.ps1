<#
.SYNOPSIS
A CheckBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.CheckBox class

.DESCRIPTION
Outputs a checkbox control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter

.PARAMETER Name
The name of the control.  This will be the name of a property in the output of the Dialog function

.PARAMETER InitialValue
True means checked, False means not checked

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  CheckBox Eeny
  CheckBox Meeny -InitialValue $true
  CheckBox Miny

} -Property @{ Title = 'CheckBox'; MinHeight = 233; MinWidth = 377; }

#In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.checkbox
#>
function CheckBox {
  [CmdletBinding()]
  Param([string]$Name,
    [Boolean]$InitialValue = $false,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name      = $name
    Content   = $Name
    IsChecked = $InitialValue
  }

  $chk = New-WPFControl -type System.Windows.Controls.CheckBox -Properties $baseProperties, $property

  $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked}
  $chk | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}