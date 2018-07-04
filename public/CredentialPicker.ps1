Function CredentialPicker {
    [CmdletBinding()]
    Param([string]$Name,
          [PSCredential]$InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }

    $t = TextBox -Name "Temp_$name" -property @{IsReadOnly = $true}
    if ($InitialValue) {
        $t.tag = $InitialValue
        $t.text = $initialvalue.GetNetworkCredential().UserName
    }
    else {
        $t.tag = $null
        $t.text = '<none>'
    }
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Edit'
        Tag     = $t
    }
    $btn.Add_Click( {
            Param($sender, $e)
            $txt = [System.Windows.Controls.TextBox]$sender.Tag

            $cred = CredentialDialog $txt.tag
            $txt.Tag = $cred
            $txt.Text = $cred.GetNetworkCredential().Username
        })
    $stack.Children.Add($btn) | out-null
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].Tag} -PassThru

}