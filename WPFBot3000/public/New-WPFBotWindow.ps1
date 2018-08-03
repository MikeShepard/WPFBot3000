<#
.SYNOPSIS
Outputs a window with the indicated wpf controls.

.DESCRIPTION
Creates a window object with 2-columns (labels and controls) or 1-column (using -HideLabels, with controls only).
Outputs the window without displaying it.
Note, the window doesn't build its own ok/cancel buttons so you are responsible for that.

.PARAMETER Contents
A scriptblock that outputs the controls you want in the window

.PARAMETER labelMap
A hashtable with items of the form ControlName='Desired label'.  If the control is labeled it will use this text instead of the control name.

.PARAMETER Events
An array of hashtables of event handlers for controls in the dialog.  Each should have Name (control name), EventName, and Action.

.PARAMETER title
The window title

.PARAMETER HideLabels
Use this switch if you want no labels at all (no column for them, even)

.PARAMETER Property
A hashtable of properties to set on the window

.PARAMETER ShowGridLines
Switch to say whether to show grid lines in all grids (for layout debugging)

.PARAMETER ShowForValue
Switch to say whether you want the window immediately shown (showdialog()) and if OK pressed
to output the "calculated output of the window".  Window with -ShowForValue works similarly to 
Dialog function but doesn't automatically add Ok and Cancel button.

.EXAMPLE
$w=Window {
    Textbox Name
    Button Personalize -name mike -action {
                                 $txt=$this.Window.GetControlByName('Name')
                                 $lbl=$this.Window.GetControlByName('Greeting')
                                 $lbl.Content="Hello, $($txt.Text)"}
    Label 'Hello, World' -name 'Greeting'
}
$w.ShowDialog()

.NOTES
General notes
#>
function New-WPFBotWindow {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$title,
        [switch]$HideLabels, 
        [hashtable]$property,
        [Switch]$ShowGridLines,
        [Switch]$ShowForValue)
    $script:ShowGridLines = $ShowGridLines.IsPresent
    $baseProperties = @{
        SizeToContent = 'WidthAndHeight'
        Margin        = 10
    }
    $w = New-WPFControl -type system.windows.window -properties $BaseProperties, $property 
    [array]$windowContent=& $contents
    if ($windowContent.Count -gt 1){
        $windowContent=StackPanel {$windowContent} -Orientation Vertical
    }
    $w.Content= $windowContent
    $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {
        Param($name)
            $this.Content.GetControlByName($name)
    }
    $w | add-member -MemberType ScriptMethod -Name ShowForValue -Value     {
        if ($this.ShowDialog()) {
            if ($this | Get-Member OverrideOutput) {
                $This.OverrideOutput
            } else {
                $output=$this.GetWindowOutput()
                if($output | get-member BuiltinDataEntryGrid){
                    $output.BuiltinDataEntryGrid
                } else {
                    $output
                }
            }
        }
    }
    $w | add-member -MemberType ScriptMethod -Name GetWindowOutput -value {
        if ($this | Get-Member -Name OverrideOutput -MemberType NoteProperty) {
            return $this.OverrideOutput
        }
        $this.Content.GetControlValue()
    }

    $control = $null
    foreach ($item in $events) {
        $control = $w.GetControlByName($item.Name)
        if ($control) {
            $control."Add_$($item.EventName)"($item.Action)
        }
    }
    if ($title) {
        $w.Title = $title
    }
    if ($ShowForValue) {
        $w.ShowForValue()
    } else {
        $w
    }

}

New-Alias -Name Window -Value New-WPFBotWindow -force