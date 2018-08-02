<#
.SYNOPSIS
Adds an event handler to a control

.DESCRIPTION
Adds an event handler to a control

.PARAMETER EventName
The name of the event to be handled (without On)

.PARAMETER Action
The action to be executed when the event is triggered

.PARAMETER Control
The control that the event is for

.EXAMPLE

$w=Window {
    TextBox Fred -property @{MinWidth=50}
    CheckBox Barney | HandlesEvent Checked {$Fred.Text=$fred.Text.ToUpper()}
} -ShowForValue

.NOTES
General notes
#>
function HandlesEvent {
    [CmdletBinding()]
    Param([String]$EventName,
        [ScriptBlock]$Action,
        [Parameter(ValueFromPipeline = $true)]$Control)
    process {
        $control."Add_$EventName"($Action)
        $control
    }
}