<#
.SYNOPSIS
A TabItem control (a tab in a TabControl) that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TabItem class

.DESCRIPTION
A TabItem control (a tab in a TabControl)

.PARAMETER Label
The label of the tab

.PARAMETER Contents
A scriptblock that outputs controls you want in the tab

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the control

.EXAMPLE
Dialog {

  TabControl Tabs {

    TabItem Before { TextBox Description -Property @{ Width = 377 }}
    TabItem After { TextBox Description2 -Property @{ Width = 377 }}
    
  } -Property @{ MinHeight = 233; MinWidth = 377; }
  
} -Property @{ Title = 'TabItem'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.tabitem
#>
function TabItem {
  [CmdletBinding()]
  Param([string]$Label,
        [Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
  $baseProperties = @{}
  if($label) {
      $baseProperties.Header=$label
      $baseProperties.Name=$label
  }
  if ($name) {
      $baseProperties.Name = $name
  }
  $tabItem=New-WPFControl -type System.Windows.Controls.TabItem -Properties $baseProperties,$property
  [System.Windows.UIElement[]]$c = & $Contents
  $tabItem.Content = StackPanel -Contents { $c }
  $tabItem | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $tabitem  | add-member -MemberType NoteProperty -Name HideLabel -Value $True
  $tabitem | add-member -Name GetControlValue -MemberType ScriptMethod -Value {
      $this.Content.GetControlValue()
  } -PassThru
}