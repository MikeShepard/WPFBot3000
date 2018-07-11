<#
.SYNOPSIS
A DataGrid control

.DESCRIPTION
A DataGrid control

.PARAMETER name
The name of the control

.PARAMETER contents
The contents of the DataGrid

.PARAMETER initialValue
The item from $contents that is initally selected

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$files=get-childitem c:\windows -file | select-object -first 10
Dialog {
    DataGrid Files -contents $files -property @{MaxWidth=600;MaxHeight=400;IsReadOnly=$true}
}

.NOTES
General notes
#>
function DataGrid {
    [CmdletBinding()]
    Param([string]$name,
          [Array]$contents = @(),
          $initialValue,
          [Hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $grid=New-WPFControl -type System.Windows.Controls.DataGrid -Properties $baseProperties,$property

    if ($Contents) {
      $grid.ItemsSource=$Contents
    }
    $grid | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $grid | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem } -PassThru
}
