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
function CheckBox {
    [CmdletBinding()]
    Param($Name, [Boolean]$InitialValue = $false, $property = @{})
    $baseProperties = @{
        Name      = $name
        Content   = $Name
        IsChecked = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $chk = new-object System.Windows.Controls.CheckBox -Property $properties
    $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked} -PassThru
}