<#
.SYNOPSIS
Simple dialog with controls for username and password

.DESCRIPTION
Simple dialog with controls for username and password.  Output is a PSCredential object.

.PARAMETER username
A credential object.  If populated, the Username property will be used to populate the UserName textbox.

.EXAMPLE
An example

.NOTES
General notes
#>
function CredentialDialog {
    [CmdletBinding()]
    Param([PSCredential]$username=[PSCredential]::Empty)
    if($username){
        $dialog_username=$username.username
    } else {
        $dialog_username=''
    }
    $o = Dialog {Textbox UserName -InitialValue $dialog_username
                 Password Password}
    if ($o) {
        New-Object System.Management.Automation.PSCredential ($o.UserName, $o.Password )
    }
}