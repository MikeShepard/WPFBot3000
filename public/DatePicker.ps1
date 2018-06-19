<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Name
Parameter description

.PARAMETER InitialValue
Parameter description

.PARAMETER property
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function DatePicker {
    [CmdletBinding()]
    Param($Name, [DateTime]$InitialValue = (get-date), $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $dpck = new-object System.Windows.Controls.DatePicker -Property $properties
    $dpck | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}