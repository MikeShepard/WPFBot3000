
<#
.SYNOPSIS
Two-column data entry grid, labels in first column, controls in second column

.DESCRIPTION
Two-column data entry grid, labels in first column, controls in second column

.PARAMETER Name
The name of the control

.PARAMETER Contents
The controls that are contained in the data entry grid

.PARAMETER Property
A hashtable of properties to be set on the control

.PARAMETER HideLabels
Switch to say whether all labels are hidden

.EXAMPLE
dialog {
    TabControl -name Top {
        TabItem Fred  {
            DataEntryGrid -name Tab1 {
                TextBox ABC -Property @{ Width = 233 }
                TextBox DEF -Property @{ Width = 233 }
            }
        }
        TabItem Barney {
            listbox -contents (dir c:\temp | select -first 10) -name Barney2
        }
        TabItem Wilma {
            listbox -contents (dir c:\temp | select -first 10) -name Wilma2
        }
        TabItem Betty {
            listbox -contents (dir c:\temp | select -first 10) -name Betty2
        }
    }
}
.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.grid
#>

function DataEntryGrid {
    [CmdletBinding()]
    Param($Name,
        [scriptblock]$Contents,
        [Hashtable]$Property,
        [Switch]$HideLabels)

    $baseProperties = @{
        Margin        = 5
        ShowGridLines = $ShowGridLines
    }
    $grid = New-WPFControl -type System.Windows.Controls.Grid -Properties $baseProperties, $Property
    if ($Name) {
        $Grid.Name = $Name
    }

    $controlColumn = 0
    if (-not $HideLabels) {
        $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = 'Auto'}))
        $controlColumn = 1
    }
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{}))
    $Row = 0
    $c = & $Contents
    foreach ($control in $c) {
        $hideControlLabel = $HideLabels
        if ((Get-Member -InputObject $control -name HideLabel) -or ($Control.Visibility -eq 'Collapsed')) {
            $hideControlLabel = $true
        }
        if (($hideControlLabel -eq $false) -or $control.Visibility -ne 'Collapsed') {
            $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height = 'Auto'}))
        }
        else {
            $row = [Math]::Max(0, $row - 1)
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
        [System.Windows.Controls.Grid]::SetColumn($control, $controlColumn)
        [System.Windows.Controls.Grid]::SetRow($control, $row)
        $row += 1
        $grid.Children.Add($control) | out-null


    }
    $grid | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $Grid | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if (($_| get-member GetControlValue) -and $_.Name) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $grid | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru

}