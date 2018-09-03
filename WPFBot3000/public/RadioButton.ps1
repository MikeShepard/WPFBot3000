<#
.SYNOPSIS
A RadioButton control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.RadioButton class

.DESCRIPTION
Outputs a RadioButton control.  Set the initial "checked" state with the -InitialValue parameter, and set any control properties using the -Property parameter.

.PARAMETER Name
The name of the control.  This will be the name of a property in the output of the Dialog function.

.PARAMETER InitialValue
True means checked, False means not checked

.PARAMETER GroupName
The group that the radio button belongs to

.PARAMETER Property
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
In the window there will be three radio buttons, labeled Eeny, Meeny, and Miny.
.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.radiobutton
#>
function RadioButton {
    [CmdletBinding()]
    Param([string]$Name,
        [Boolean]$InitialValue = $false,
        [string]$GroupName,
        [hashtable]$property = @{})
    $baseProperties = @{
        Name      = $Name
        Content   = $Name
        GroupName = $GroupName
        IsChecked = $InitialValue
    }

    $chk = New-WPFControl -type System.Windows.Controls.RadioButton -Properties $baseProperties, $Property

    $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked}
    $chk | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}