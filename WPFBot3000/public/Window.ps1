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
function Window {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$title,
        [switch]$HideLabels, [hashtable]$property,
        [Switch]$ShowGridLines)
    $script:ShowGridLines = $ShowGridLines.IsPresent
    $baseProperties = @{
        SizeToContent = 'WidthAndHeight'
        Margin        = 10
    }
    $w = New-WPFControl -type system.windows.window -properties $BaseProperties, $property
    [System.Windows.UIElement[]]$c = & $Contents
    $grid = new-object System.Windows.Controls.Grid -Property @{
        Margin        = 5
        ShowGridLines = $ShowGridLines
    }
    $w.Content = $grid
    $controlColumn = 0
    if (-not $HideLabels) {
        $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = 'Auto'}))
        $controlColumn = 1
    }
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{}))
    $Row = 0
    foreach ($control in $c) {
        $hideControlLabel=$HideLabels
        if((Get-Member -InputObject $control -name HideLabel) -or ($Control.Visibility -eq 'Collapsed')){
            $hideControlLabel=$true
        }
        if(($hideControlLabel -eq $false) -or $control.Visibility -ne 'Collapsed'){
            $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height = 'Auto'}))
        } else {
            $row=[Math]::Max(0,$row-1)
        }

        if (-not $hideControlLabel) {
                $labelText = $Control.Name
                if ($labelMap.ContainsKey($control.Name)) {
                    $labelText = $labelMap[$control.Name]
                }
                $l = Label $labelText
                [System.Windows.Controls.Grid]::SetRow($l, $row)
                [System.Windows.Controls.Grid]::SetColumn($l, 0)
                $grid.Children.Add($l) | out-null
        }
        [System.Windows.Controls.Grid]::SetRow($control, $row)
        [System.Windows.Controls.Grid]::SetColumn($control, $controlColumn)
        $grid.Children.Add($control) | out-null
        $row += 1
    }
    $Grid | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        } else {
            [pscustomobject]$d
        }
    }
    $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {
        Param($name)
        if ($this.Content.Name -eq $name) {
            $this.Content
        } else {
            $this.Content.GetControlByName($name)
        }
    }
    $grid | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $w | add-member -MemberType ScriptMethod -Name ShowForValue -Value {if($this.ShowDialog()){$this.GetWindowOutput()}}
    $w | add-member -MemberType ScriptMethod -Name GetWindowOutput -value {
        if ($this | Get-Member -Name OverrideOutput -MemberType NoteProperty) {
            return $this.OverrideOutput
        }
        $output = [Ordered]@{}
        $this.Content.Children | ForEach-Object { if (($_ | get-member GetControlValue) -and ($_| get-member Name)) {
                if ($_.Name) {
                    $output.Add($_.Name, $_.GetControlValue())
                }
            }}
        [PSCustomObject]$output
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
    $w.Width = $grid.width
    $w

}