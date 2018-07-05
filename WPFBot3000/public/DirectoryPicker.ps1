<#
.SYNOPSIS
A directory picker control

.DESCRIPTION
A directory picker control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The folder to set it to initially

.EXAMPLE
dialog {
    DirectoryPicker Folder -InitialValue C:\temp
}

.NOTES
General notes
#>
Function DirectoryPicker {
    [CmdletBinding()]
    Param([string]$Name,
          [String]$InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $t = TextBox -Name "Temp_$name" -InitialValue $InitialValue -property @{IsReadOnly = $true}
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Browse'
        Tag     = $t
    }
    $btn.Add_Click( {
            PAram($sender, $e)
            $ofd = new-object System.Windows.Forms.FolderBrowserDialog
            $txt = [System.Windows.Controls.TextBox]$sender.Tag
            if ($txt.Text) {
                $ofd.SelectedPath = $txt.Text
            }
            if ($ofd.ShowDialog()) {
                $txt.Text = $ofd.SelectedPath
            }
        })
    $stack.Children.Add($btn) | out-null
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].GetControlValue()} -PassThru

}