<#
.SYNOPSIS
Outputs a checkbox control

.DESCRIPTION
Outputs a checkbox control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

.PARAMETER Name
The name of the control.  This will be the name of a property in the output of the Dialog function.

.PARAMETER InitialValue
True means checked, False means not checked

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny -InitialValue $true
       CheckBox Miny
    }
    TextBox Moe
}
```
In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny.
.NOTES
General notes
#>
function CheckBox {
    [CmdletBinding()]
    Param([string]$Name,
          [Boolean]$InitialValue = $false,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name      = $name
        Content   = $Name
        IsChecked = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $chk = new-object System.Windows.Controls.CheckBox -Property $properties
    $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked}
    $chk | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}