<#
.SYNOPSIS
A ListBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ListBox class

.DESCRIPTION
A ListBox control

.PARAMETER Name
The name of the control

.PARAMETER Contents
The contents of the listbox

.PARAMETER InitialValue
The item from $contents that is initally selected

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER MultiSelect
Sets the selectionMode of the listbox to "Extended"

.EXAMPLE
$files = Get-ChildItem C:\Windows -file | Select-Object -First 10

Dialog {

  ListBox Files -Contents $files

} -Property @{ Title = 'ListBox'; MinHeight = 233; MinWidth = 377 }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.listbox
#>
function ListBox {
  [CmdletBinding()]
  Param([string]$Name,
    [Array]$Contents = @(),
    $InitialValue,
    [Hashtable]$Property = @{},
    [switch]$MultiSelect)
  $baseProperties = @{
    Name = $name
  }
  $l = New-WPFControl -type System.Windows.Controls.ListBox -Properties $baseProperties, $property
  if ($MultiSelect) {
    $l.SelectionMode = 'Extended'
  }
  if ($Contents) {
    $contents | ForEach-Object {
      $lvi = new-object System.Windows.Controls.ListBoxItem
      $lvi.Tag = $_
      $lvi.Content = $_.ToString()
      $l.Items.Add($lvi) | out-null
      if ($initialValue -and $_ -eq $initialValue) {
        $l.SelectedItem = $lvi
      }
    }
  }
  $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$items = $this.SelectedItems
    foreach ($item in $items) {
      if ($item -is [System.Windows.Controls.Listboxitem] -and $item.Tag) {
        $item.Tag
      }
      else {
        $item
      }
    }
  } -PassThru
}