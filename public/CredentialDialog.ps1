
<#
#example code
window { TextBox Fred 'hello world'
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox'
         Checkbox Wilma 1
         Combobox Betty Able,Baker,Charlie}
#>

<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER username
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function CredentialDialog {
    [CmdletBinding()]
    Param([PSCredential]$username)
    $o = Dialog {Textbox UserName -InitialValue $username.UserName
        Password Password}
    if ($o) {
        New-Object System.Management.Automation.PSCredential ($o.UserName, $o.Password )
    }
}