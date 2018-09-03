<#
.SYNOPSIS
A File Picker control

.DESCRIPTION
A file picker control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The file the control initially points to

.EXAMPLE
dialog {
    FilePicker TheFile -initialvalue c:\temp\web.config
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.forms.openfiledialog
#>
Function FilePicker {
    [CmdletBinding()]
    Param([string]$Name,
        [string]$InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $Name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $t = TextBox -Name "Temp_$name" -InitialValue $InitialValue -property @{IsReadOnly = $true}
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Browse'
        Tag     = $t
    }
    $btn.Add_Click( {
            Param($sender, $e)
            $ofd = new-object Microsoft.Win32.OpenFileDialog
            $txt = [System.Windows.Controls.TextBox]$sender.Tag
            if ($txt.Text) {
                $ofd.InitialDirectory = [system.io.path]::GetDirectoryName($txt.Text)
                $ofd.FileName = [system.io.path]::GetFileName($txt.Text)
            }
            if ($ofd.ShowDialog()) {
                $txt.Text = $ofd.FileName
            }
        })
    $stack.Children.Add($btn) | out-null
    $stack | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].GetControlValue()} -PassThru

}