function CredentialDialog {
    [CmdletBinding()]
    Param([PSCredential]$username)
    $o = Dialog {Textbox UserName -InitialValue $username.UserName
        Password Password}
    if ($o) {
        New-Object System.Management.Automation.PSCredential ($o.UserName, $o.Password )
    }
}