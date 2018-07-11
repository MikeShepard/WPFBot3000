<#
.SYNOPSIS
A grid panel, which displays its contents in rows and columns

.DESCRIPTION
A grid panel, which displays its contents in rows and columns

.PARAMETER Contents
A scriptblock that outputs controls that you want in the grid

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the grid control.  This name will be a property in the output of the dialog function

.PARAMETER ColumnCount
The number of columns in the grid.  The number of rows is determined by the number of controls in $Contents.

.EXAMPLE
Dialog {
      Grid -columnCount 3   {
        1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}
      } -Property @{ShowGridlines=$true}
   }

.NOTES
General notes
#>
function Grid {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
            [hashtable]$Property = @{},
               [string]$name,
                  [int]$ColumnCount = 1)
    $baseProperties = @{VerticalAlignment = 'Stretch'
                        HorizontalAlignment = 'Stretch'
                        ShowGridLines=$Script:ShowGridLines}
    if ($name) {
        $baseProperties.Name = $name
    }
    $grid=New-WPFControl -type System.Windows.Controls.Grid -Properties $baseProperties,$property
    
    $grid.RowDefinitions.Clear()
    $grid.ColumnDefinitions.Clear()

    1..$ColumnCount |  ForEach-Object { $grid.ColumnDefinitions.Add((new-object ColumnDefinition -property @{}))}


    [System.Windows.UIElement[]]$c = & $Contents
    $objectCount = 0
    $c | foreach-object {
        $row = [Math]::Truncate($objectCount / $columnCount)
        $col = $objectCount % $columnCount
        if ($col -eq 0) {
            $grid.RowDefinitions.Add( (new-object RowDefinition -Property @{}))
        }
        #fix width or height of column or row with a gridsplitter in it
        if ($_ -is [System.Windows.Controls.GridSplitter]) {
            if($_.Width -eq 5){
                $grid.ColumnDefinitions[$col].Width = 5
            } else {
                $grid.RowDefinitions[$row].Height=5
            }
        }
        $Grid.Children.Add($_) | out-null
        [Grid]::SetColumn( $_, $col)
        [Grid]::SetRow($_, $row)
        $objectCount += 1
    }
    $Grid | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $Grid | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
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
    $grid | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}