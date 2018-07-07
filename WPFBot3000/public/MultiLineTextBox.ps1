<#
.SYNOPSIS
A multi-line textbox control

.DESCRIPTION
A multi-line textbox control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The text initially loaded into the control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    MultilineTextBox Editor
}

.NOTES
General notes
#>
function MultiLineTextBox {
    [CmdletBinding()]
    Param([string]$Name,
          [string]$InitialValue = "",
          [hashtable]$property = @{})
    $baseProperties = @{
        Name                        = $name
        Text                        = $InitialValue
        TextWrapping                = "Wrap"
        AcceptsReturn               = "True"
        VerticalScrollBarVisibility = "Visible"
    }
    $o=New-WPFControl -type System.Windows.Controls.TextBox -Properties $baseProperties,$property

    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}
