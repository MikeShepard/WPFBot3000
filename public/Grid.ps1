
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Contents
Parameter description

.PARAMETER Property
Parameter description

.PARAMETER name
Parameter description

.PARAMETER ColumnCount
Parameter description

.PARAMETER RowCount
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Grid {
    [CmdletBinding()]
    Param([Scriptblock]$Contents, $Property = @{}, $name, $ColumnCount = 1, $RowCount = 1)
    $baseProperties = @{VerticalAlignment='Stretch';HorizontalAlignment='Stretch'}
    if ($name) {
        $baseProperties.Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $Grid = new-object Grid -Property $properties
    $grid.RowDefinitions.Clear()
    $grid.ColumnDefinitions.Clear()
    1..$RowCount | ForEach-Object { $grid.RowDefinitions.Add( (new-object RowDefinition -Property @{}))}
    1..$ColumnCount |  ForEach-Object { $grid.ColumnDefinitions.Add((new-object ColumnDefinition -property @{}))}


    [System.Windows.UIElement[]]$c = & $Contents
    $objectCount = 0
    $c | foreach-object {
        $row = [Math]::Truncate($objectCount / $columnCount)
        $col = $objectCount % $columnCount
        if($_ -is [System.Windows.Controls.GridSplitter]){
            $grid.ColumnDefinitions[$col].Width=5
        }
        $Grid.Children.Add($_) | out-null
        [Grid]::SetColumn( $_, $col)
        [Grid]::SetRow($_, $row)
        $objectCount += 1
    }
    $Grid | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $Grid | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }
    } -PassThru
}