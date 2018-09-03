<#
.SYNOPSIS
A DataGrid control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DataGrid class

.DESCRIPTION
A DataGrid control

.PARAMETER Name
The name of the control

.PARAMETER Contents
The contents of the DataGrid

.PARAMETER InitialValue
The item from $contents that is initally selected

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$files=get-childitem c:\windows -file | select-object -first 10
Dialog {
    DataGrid Files -contents $files -property @{MaxWidth=600;MaxHeight=400;IsReadOnly=$true}
} -Property @{ Title = 'DataGrid' }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.datagrid
#>
function DataGrid {
    [CmdletBinding()]
    Param([string]$Name,
        [Array]$contents = @(),
        $initialValue,
        [Hashtable]$property = @{})
    $baseProperties = @{
        Name = $Name
    }
    $grid = New-WPFControl -type System.Windows.Controls.DataGrid -Properties $baseProperties, $Property

    if ($Contents) {
        $grid.ItemsSource = $Contents
    }
    $grid | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $grid | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem } -PassThru
}
