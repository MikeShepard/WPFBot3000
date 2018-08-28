<#
.SYNOPSIS
A Password control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.PasswordBox class

.DESCRIPTION
A password control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The password to be loaded initially. Note that this is a secureString

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

    Password SAPassword

} -Property @{ Title = 'Password'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.passwordbox
#>
function Password {
  [CmdletBinding()]
  Param([string]$Name,
    [SecureString]$InitialValue,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name = $name

  }
  if ($initialValue) {
    $BaseProperties.SecurePassword = $InitialValue
  }
  $o = New-WPFControl -type System.Windows.Controls.PasswordBox -Properties $baseProperties, $property

  $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SecurePassword} -PassThru
}