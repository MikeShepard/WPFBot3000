
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
function TextBox {
    [CmdletBinding()]
    Param($Name, $InitialValue = "", $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.TextBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}