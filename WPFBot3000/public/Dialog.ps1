<#
.SYNOPSIS
Creates a window with the requested controls, OK, and Cancel and outputs an object representing the values in the window.

.DESCRIPTION
Creates a window with the requested controls, OK, and Cancel and outputs an object representing the values in the window.

.PARAMETER Contents
Scriptblock containing statements that output controls that you want in the dialog.

.PARAMETER labelMap
A hashtable with items of the form ControlName='Desired label'.  If the control is labeled it will use this text instead of the control name.

.PARAMETER Events
An array of hashtables of event handlers for controls in the dialog.  Each should have Name (control name), EventName, and Action.

.PARAMETER title
The window title

.EXAMPLE
Dialog {
TextBox FirstName
TextBox LastName
TextBox EmailAddress
DatePicker ReminderDate
}

# Displays a window with 3 textboxes and a date picker and if the user presses ok (instead of cancel) it outputs an object with 4 properties (populated from the controls)



.NOTES
General notes
#>
function Dialog {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$title,
        [hashtable]$property)
    $c = & $contents
    $PSBoundParameters.Remove('Contents')| out-null
    $w = Window {
        $c
        StackPanel {Button OK {  $this.Window.DialogResult = $true } -property @{}
                    Button Cancel { $this.Window.DialogResult = $false} -property @{}
        } -Orientation Horizontal -Property @{}
    } @PSBoundParameters
    $w.Content.RowDefinitions[-1].Height='Auto'
    $dialogResult = $w.Showdialog()
    if ($dialogResult) {
        $w.GetWindowOutput()
    }
}
