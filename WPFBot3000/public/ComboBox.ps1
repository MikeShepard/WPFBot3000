<#
.SYNOPSIS
A ComboBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ComboBox class

.DESCRIPTION
Outputs a ComboBox control with a given set of contents and optionally a selected value.

.PARAMETER Name
The name of the control.  This will be the name of a property of the output of the Dialog function.

.PARAMETER Contents
A list of items to fill the ComboBox.

.PARAMETER InitialValue
The item from $Contents that is initially selected.

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    Combobox Guess -contents 'a','b','c' -initialvalue 'b'
} -Property @{ Title = 'ComboBox' }
# A Dialog box with ComboBox having 3 choices, the second is selected.

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.combobox
#>
function ComboBox {
    [CmdletBinding()]
    Param([string]$Name,
          [Array]$Contents,
          $InitialValue,
          [hashtable]$Property = @{})
    $baseProperties = @{
        Name = $Name
    }
    $l=New-WPFControl -type System.Windows.Controls.Combobox -Properties $baseProperties,$Property

    if ($InitialValue) {
        $l.SelectedItem = $InitialValue
    }

    $contents | ForEach-Object {$l.Items.Add($_) | out-null }
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}