<#
.SYNOPSIS
A TreeView control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TreeView class

.DESCRIPTION
A TreeView control

.PARAMETER Name
The name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
  
  #TODO
  
} -Property @{ Title = 'TreeView'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.treeview
#>
function TreeView {
  [CmdletBinding()]
  Param([string]$Name,
    [hashtable]$Property = @{})
  $baseProperties = @{
    Name = $name
  }
  $tree = New-WPFControl -type System.Windows.Controls.TreeView -Properties $baseProperties, $property

  $tree | add-member -Name AddTreeViewItem -membertype ScriptMethod -value ${function:Add-TreeViewItem}
  $tree | add-member -Name GetTreeViewItemByLabel -membertype ScriptMethod -value ${function:Get-TreeViewItemByLabel}
  $tree | add-member -Name GetTreeViewItemByObject -membertype ScriptMethod -value ${function:Get-TreeViewItemByObject}
  $tree | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item = $this.SelectedItem
    if ($item -is [System.Windows.Controls.TreeViewItem] -and $item.Tag) {
      $item.Tag
    }
    else {
      $item
    }} -PassThru
}