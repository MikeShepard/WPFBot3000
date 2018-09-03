<#
.SYNOPSIS
A DirectoryPicker control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Forms.FolderBrowserDialog class

.DESCRIPTION
A DirectoryPicker picker control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The folder to set it to initially

.EXAMPLE
dialog {
    DirectoryPicker Folder -InitialValue C:\Windows
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.forms.folderbrowserdialog
#>
Function DirectoryPicker {
    [CmdletBinding()]
    Param([string]$Name,
        [String]$InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $Name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $t = TextBox -Name "Temp_$Name" -InitialValue $InitialValue -property @{IsReadOnly = $true}
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Browse'
        Tag     = $t
    }
    $btn.Add_Click( {
            Param($sender, $e)
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