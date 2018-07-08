<#
.SYNOPSIS
Outputs a radiobutton control

.DESCRIPTION
Outputs a radiobutton control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

.PARAMETER Name
The name of the control.  This will be the name of a property in the output of the Dialog function.

.PARAMETER InitialValue
True means checked, False means not checked

.PARAMETER GroupName
The group that the radio button belongs to

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    StackPanel -Name Options -orientation Horizontal {
       RadioButton Eeny -groupName Options
       RadioButton Meeny -InitialValue $true -groupName Options
       RadioButton Miny  -groupName Options
    }
    TextBox Moe
}
```
In the window there will be three checkboxes, labeled Eeny, Meeny, and Miny.
.NOTES
General notes
#>
function RadioButton {
    [CmdletBinding()]
    Param([string]$Name,
          [Boolean]$InitialValue = $false,
          [string]$GroupName,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name      = $name
        Content   = $Name
        GroupName = $GroupName
        IsChecked = $InitialValue
    }

    $chk=New-WPFControl -type System.Windows.Controls.RadioButton -Properties $baseProperties,$property

    $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked}
    $chk | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}