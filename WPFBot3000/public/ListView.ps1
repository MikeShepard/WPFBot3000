<#
.SYNOPSIS
A ListView control

.DESCRIPTION
A ListView control

.PARAMETER name
The name of the control

.PARAMETER contents
The contents of the ListView

.PARAMETER initialValue
The item from $contents that is initally selected

.PARAMETER property
Properties to extend/override the base properties defined in the function

.PARAMETER DisplayProperty 
Properties that get turned into columns in the ListView

.PARAMETER MultiSelect
Sets the selectionMode of the listbox to "Extended"

.EXAMPLE
$files=get-childitem c:\windows -file | select-object -first 10
Dialog {
    ListView Files -contents $files
}

.NOTES
General notes
#>
function ListView {
    [CmdletBinding()]
    Param([string]$name,
        [Array]$contents = @(),
        $initialValue,
        [Hashtable]$property = @{},
        [Array]$DisplayProperty,
        [Switch]$MultiSelect)
    $baseProperties = @{
        Name = $name
    }
    $l = New-WPFControl -type System.Windows.Controls.ListView -Properties $baseProperties, $property
    $g = New-WPFControl -type System.Windows.Controls.GridView -properties @{AllowsColumnReorder = $true}
    if($MultiSelect){
        $l.SelectionMode='Extended'
    }
    $l.View = $g
    if ($DisplayProperty) {
        foreach ($prop in $displayProperty) {
            $column = New-WPFControl System.Windows.Controls.GridViewColumn -properties @{Header = $prop; DisplayMemberBinding = (new-object System.Windows.Data.Binding $prop)}
            $g.Columns.Add($column)
        }
    }

    if ($Contents) {
        if (-not $displayProperty) {
            $displayProperty = $contents[0]| get-member -MemberType Properties | select-object -ExpandProperty Name
        }
        $l.ItemsSource = $contents
        if ($initialValue) {
            $l.SelectedValue = $initialValue
        }
    }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$items = $this.SelectedItems
        foreach ($item in $items) {
            if ($item -is [System.Windows.Controls.ListViewItem] -and $item.Tag) {
                $item.Tag
            }
            else {
                $item
            }
        }
    } -PassThru
}
