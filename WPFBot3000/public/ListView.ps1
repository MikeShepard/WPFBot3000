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
          [Array]$DisplayProperty)
    $baseProperties = @{
        Name = $name
    }
    $l=New-WPFControl -type System.Windows.Controls.ListView -Properties $baseProperties,$property
    $g=New-WPFControl -type System.Windows.Controls.GridView -properties @{AllowsColumnReorder=$true}
    $l.View=$g
    if ($Contents) {
        if(-not $displayProperty){
            $displayProperty=$contents[0]| get-member -MemberType Properties | select-object -ExpandProperty Name
        }
        foreach ($prop in $displayProperty){
            $column=New-WPFControl System.Windows.Controls.GridViewColumn -properties @{Header=$prop;DisplayMemberBinding=(new-object System.Windows.Data.Binding $prop)}
            $g.Columns.Add($column)
        }
        $l.ItemsSource=$contents
        if ($initialValue -and $_ -eq $initialValue) {
           $l.SelectedItem = $_
        }
    }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
                                                                           if($item -is [ListViewitem] -and $item.Tag){
                                                                               $item.Tag
                                                                           } else {
                                                                               $item
                                                                           }} -PassThru
}
