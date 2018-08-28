<#
.SYNOPSIS
A ListView control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ListView class

.DESCRIPTION
A ListView control

.PARAMETER Name
The name of the control

.PARAMETER Contents
The contents of the ListView

.PARAMETER InitialValue
The item from $contents that is initally selected

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER DisplayProperty 
Properties that get turned into columns in the ListView

.PARAMETER MultiSelect
Sets the selectionMode of the listbox to "Extended"

.EXAMPLE
$files = Get-ChildItem C:\Windows -file | Select-Object -First 10

Dialog {
  
  #TODO
  
} -Property @{ Title = 'ListView'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.listview
#>
function ListView {
  [CmdletBinding()]
  Param([string]$Name,
    [Array]$Contents = @(),
    $InitialValue,
    [Hashtable]$Property = @{},
    [Array]$DisplayProperty,
    [Switch]$MultiSelect)
  $baseProperties = @{
    Name = $name
  }
  $l = New-WPFControl -type System.Windows.Controls.ListView -Properties $baseProperties, $property
  $g = New-WPFControl -type System.Windows.Controls.GridView -properties @{AllowsColumnReorder = $true}
  if ($MultiSelect) {
    $l.SelectionMode = 'Extended'
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