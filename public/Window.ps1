<#
.SYNOPSIS
Find a control in a WPF window

.DESCRIPTION
Unlike FindName(), FindChild actually works with dynamically created controls.  It walks the
visual control tree to find all of the controls in the window, returning the first one that
has the right name.

.PARAMETER parent
A wpf control that contains other controls (generally a window or page)

.PARAMETER childName
The name of the control to find

.EXAMPLE
$w=Window {
    StackPanel {
        TextBox Fred
        CheckBox Barney
    }
}

FindChild -Parent $w -childName Barney

Output
<The "Barney checkbox control>

#><#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Contents
Parameter description

.PARAMETER labelMap
Parameter description

.PARAMETER Events
Parameter description

.PARAMETER title
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Window {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$title,
        [switch]$HideLabels)
    $w = new-object system.windows.window -Property @{
        SizeToContent = 'WidthAndHeight'
        Margin        = 10
    }
    [System.Windows.UIElement[]]$c = & $Contents
    $grid = new-object System.Windows.Controls.Grid -Property @{
        Margin=5
        ShowGridLines=$true
    }
    $w.Content = $grid
    1..$C.Count | ForEach-Object { $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height='Auto'}))}
    $controlColumn = 0
    if (-not $HideLabels) {
        $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width='Auto'}))
        $controlColumn = 1
    }
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{}))
    $Row = 0
    foreach ($control in $c) {
        if (-not (Get-Member -InputObject $control -Name HideLabel )) {
            if (-not $HideLabels) {
                $labelText = $Control.Name
                if ($labelMap.ContainsKey($control.Name)) {
                    $labelText = $labelMap[$control.Name]
                }
                $l = Label $labelText
                [System.Windows.Controls.Grid]::SetRow($l, $row)
                [System.Windows.Controls.Grid]::SetColumn($l, 0)
                $grid.Children.Add($l) | out-null
            }
        }
        [System.Windows.Controls.Grid]::SetRow($control, $row)
        [System.Windows.Controls.Grid]::SetColumn($control, $controlColumn)
        $grid.Children.Add($control) | out-null
        $row += 1
    }
    $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {
                        Param($name) 
                        if($this.Content.Name -eq $name){
                           $this.Content
                        } else {
                          $this.Content.GetControlByName($name)
                        }
        }
    $control=$null
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