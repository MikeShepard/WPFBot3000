<#
.SYNOPSIS
A RichTextBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.RichTextBox class

.DESCRIPTION
A RichTextBox control

.PARAMETER Name
The name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    TextBox FirstName
    TextBox LastName
    RichTextBox Description
    DatePicker ReminderDate
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.richtextbox
#>
function RichTextBox {
    [CmdletBinding()]
    Param([string]$Name,
        [hashtable]$Property = @{})
    $baseProperties = @{
        Name   = $Name
        Height = 100
        Width  = 300

    }
    $o = New-WPFControl -type System.Windows.Controls.RichTextBox -Properties $baseProperties, $Property
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Document} -PassThru
}