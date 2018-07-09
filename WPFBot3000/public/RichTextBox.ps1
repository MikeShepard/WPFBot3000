<#
.SYNOPSIS
A RichTextbox control

.DESCRIPTION
A RichTextbox control

.PARAMETER Name
The name of the control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    TextBox FirstName
    TextBox LastName
    RichTextBox Description
    DatePicker ReminderDate
}

.NOTES
General notes
#>
function RichTextBox {
    [CmdletBinding()]
    Param([string]$Name,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
        Height=100
        Width=300

    }
    $o=New-WPFControl -type System.Windows.Controls.RichTextBox -Properties $baseProperties,$property
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Document} -PassThru
}