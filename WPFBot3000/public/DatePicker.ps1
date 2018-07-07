<#
.SYNOPSIS
A datepicker control

.DESCRIPTION
A datepicker control

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
}

.NOTES
General notes
#>
function DatePicker {
    [CmdletBinding()]
    Param([string]$Name,
          [DateTime]$InitialValue = (get-date),
          [HashTable]$property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
    }
    $dpck=New-WPFControl -type System.Windows.Controls.DatePicker -Properties $baseProperties,$property

    $dpck | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}