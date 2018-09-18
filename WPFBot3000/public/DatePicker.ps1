<#
.SYNOPSIS
A DatePicker control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DatePicker class

.DESCRIPTION
A DatePicker control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The date to set the control to

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    TextBox EmailAddress
    DatePicker BirthDate
} -Property @{ Title = 'DatePicker' }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.datepicker
#>
function DatePicker {
    [CmdletBinding()]
    Param([string]$Name,
        [DateTime]$InitialValue = (get-date),
        [HashTable]$Property = @{})
    $baseProperties = @{
        Name = $Name
        Text = $InitialValue
    }
    $dpck = New-WPFControl -type System.Windows.Controls.DatePicker -Properties $baseProperties, $Property

    $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}