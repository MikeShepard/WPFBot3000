<#
.SYNOPSIS
A Password control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.PasswordBox class

.DESCRIPTION
A Password control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The password to be loaded initially. Note that this is a secureString

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    Password SAPassword
} -title 'Enter the SA Password'

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.passwordbox
#>
function Password {
    [CmdletBinding()]
    Param([string]$Name,
        [SecureString]$InitialValue,
        [hashtable]$Property = @{})
    $baseProperties = @{
        Name = $Name
    }
    if ($initialValue) {
        $BaseProperties.SecurePassword = $InitialValue
    }
    $o = New-WPFControl -type System.Windows.Controls.PasswordBox -Properties $baseProperties, $Property

    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SecurePassword} -PassThru
}