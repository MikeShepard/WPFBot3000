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