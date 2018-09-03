<#
.SYNOPSIS
TextBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TextBox class

.DESCRIPTION
A TextBox control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The text to be loaded into the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    TextBox FirstName
    TextBox LastName
    TextBox EmailAddress
    DatePicker ReminderDate
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.textbox
#>
function TextBox {
    [CmdletBinding()]
    Param([string]$Name,
        [string]$InitialValue = "",
        [hashtable]$Property = @{})
    $baseProperties = @{
        Name = $Name
        Text = $InitialValue
    }
    $o = New-WPFControl -type System.Windows.Controls.TextBox -Properties $baseProperties, $property
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}