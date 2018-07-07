<#
.SYNOPSIS
A gridsplitter control

.DESCRIPTION
Allows the user to resize rows/columns of a grid.

.PARAMETER Orientation
Horizontal/vertical

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
An example

.NOTES
General notes
#>
function GridSplitter {
    [CmdletBinding()]
    Param([ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal',
          [hashtable]$property = @{})
    if ($orientation -eq 'Horizontal') {
        $baseProperties = @{
            HorizontalAlignment = 'Stretch'
            Width               = 5
            MaxWidth=5
        }
    } else {
        $baseProperties = @{
            VerticalAlignment = 'Stretch'
            Height            = 5
            MaxHeight=5
        }
    }
    $splitter=New-WPFControl -type System.Windows.Controls.GridSplitter -Properties $baseProperties,$property
    $splitter | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru

}