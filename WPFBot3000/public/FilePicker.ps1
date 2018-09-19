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

    $stack=StackPanel -Property @{
        Name        = $Name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    } -contents {
    $(t = TextBox -Name "Temp_$name" -InitialValue $InitialValue -property @{IsReadOnly = $true})
    Button -Property @{
        Content = 'Browse'
        Tag     = $t
    } -action  {
            Param($sender, $e)
            $ofd = new-object Microsoft.Win32.OpenFileDialog
            if ($t.Text) {
                $ofd.InitialDirectory = [system.io.path]::GetDirectoryName($t.Text)
                $ofd.FileName = [system.io.path]::GetFileName($t.Text)
            }
            if ($ofd.ShowDialog()) {
                $t.Text = $ofd.FileName
            }
        }
    }
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].GetControlValue()} -PassThru -Force

}