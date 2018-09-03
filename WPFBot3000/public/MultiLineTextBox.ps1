<#
.SYNOPSIS
A multi-line textbox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TextBox class

.DESCRIPTION
A multi-line textbox control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The text initially loaded into the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    MultilineTextBox Editor
}  -Property @{ Title = 'MultiLineTextBox' }

.NOTES
General notes
#>
function MultiLineTextBox {
    [CmdletBinding()]
    Param([string]$Name,
        [string]$InitialValue = "",
        [hashtable]$Property = @{})
    $baseProperties = @{
        Name                        = $Name
        Text                        = $InitialValue
        TextWrapping                = "Wrap"
        AcceptsReturn               = "True"
        VerticalScrollBarVisibility = "Visible"
    }
    $o = New-WPFControl -type System.Windows.Controls.TextBox -Properties $baseProperties, $Property

    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}
