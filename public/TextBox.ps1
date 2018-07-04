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
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.TextBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}