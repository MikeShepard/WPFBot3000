<#
.SYNOPSIS
A textbox control

.DESCRIPTION
A textbox control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The text to be loaded into the control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    TextBox FirstName
    TextBox LastName
    TextBox EmailAddress
    DatePicker ReminderDate
}

.NOTES
General notes
#>
function TextBox {
    [CmdletBinding()]
    Param([string]$Name,
          [string]$InitialValue = "",
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
    }
    $o=New-WPFControl -type System.Windows.Controls.TextBox -Properties $baseProperties,$property
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}