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
        [string]$title)
    $w = new-object system.windows.window -Property @{
        SizeToContent = 'WidthAndHeight'
        Margin        = New-object System.Windows.Thickness 10
    }
    [System.Windows.UIElement[]]$c = & $Contents
    $border = new-object system.windows.controls.border -property @{Padding = 10}
    $w.Content = $border
    $grid = new-object System.Windows.Controls.Grid -Property @{
        Height = $w.Height
    }
    1..$C.Count + 1 | ForEach-Object { $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height = 'Auto'}))}
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = 'Auto'}))
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = '*'}))
    $border.Child = $grid
    $Row = 0
    foreach ($control in $c) {
        if (-not ($control -is [System.Windows.Controls.CheckBox]) -and
            (-not ($control -is [System.Windows.Controls.Label]))
        ) {
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
        [System.Windows.Controls.Grid]::SetColumn($control, 1)
        $grid.Children.Add($control) | out-null
        $row += 1
    }
    $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {Param($name) FindChild -parent $this -childName $name}
    foreach ($item in $events) {
        $control = FindChild -parent $w -childName $item.Name
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