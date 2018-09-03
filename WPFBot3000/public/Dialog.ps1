<#
.SYNOPSIS
Creates a window with the requested controls, OK, and Cancel and outputs an object representing the values in the window.

.DESCRIPTION
Creates a window with the requested controls, OK, and Cancel and outputs an object representing the values in the window.

.PARAMETER Contents
Scriptblock containing statements that output controls that you want in the dialog.

.PARAMETER LabelMap
A hashtable with items of the form ControlName='Desired label'.  If the control is labeled it will use this text instead of the control name.

.PARAMETER Events
An array of hashtables of event handlers for controls in the dialog.  Each should have Name (control name), EventName, and Action.

.PARAMETER Property
A hashtable of properties to set on the window

.PARAMETER ShowGridLines
Switch to say whether to show grid lines in all grids (for layout debugging)

.PARAMETER Title
The window title

.EXAMPLE
Dialog {
    TextBox FirstName
    TextBox LastName
    TextBox EmailAddress
    DatePicker ReminderDate
} -Title Dialog

# Displays a window with 3 textboxes and a date picker and if the user presses ok (instead of cancel) it outputs an object with 4 properties (populated from the controls)

#>
function Dialog {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$Title,
        [hashtable]$Property,
        [switch]$ShowGridLines)
    $script:ShowGridLines = $ShowGridLines.IsPresent
    $c = & $contents
    $PSBoundParameters.Remove('Contents')| Out-Null
    $w = Window {
        DataEntryGrid -contents {
            $c
            StackPanel {Button OK {  $this.Window.DialogResult = $true } -property @{}
                Button Cancel { $this.Window.DialogResult = $false} -property @{}
            } -Orientation Horizontal -Property @{'Dockpanel.Dock' = 'Bottom'} 
        } -name BuiltinDataEntryGrid
    } @PSBoundParameters
    $w.Content.RowDefinitions[-1].Height = 'Auto'
    $w.ShowForValue()
}

#New-Alias -Name Dialog -Value Invoke-WPFBotDialog -Force