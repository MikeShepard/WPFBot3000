<#
.SYNOPSIS
A combobox control

.DESCRIPTION
Outputs a combobox control with a given set of contents and optionally a selected value.

.PARAMETER name
The name of the control.  This will be the name of a property of the output of the Dialog function.

.PARAMETER contents
A list of items to fill the combobox.

.PARAMETER initialValue
The item from $Contents that is initially selected.

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
dialog {
    Combobox Guess -contents 'a','b','c' -initialvalue 'b'
}
# A Dialog box with combobox having 3 choices, the second is selected.

.NOTES
General notes
#>
function ComboBox {
    [CmdletBinding()]
    Param([string]$name,
          [Array]$contents,
          $initialValue,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $l = new-object System.Windows.Controls.ComboBox -Property $properties
    if ($initialValue) {
        $l.SelectedItem = $initialValue
    }

    $contents | ForEach-Object {$l.Items.Add($_) | out-null }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}