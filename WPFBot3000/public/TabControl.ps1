<#
.SYNOPSIS
A TabControl (container for tabs) that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TabControl class

.DESCRIPTION
A TabControl (container for tabs)

.PARAMETER Contents
A scriptblock that outputs TabItem controls to embed in the TabControl

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the TabControl

.EXAMPLE
Dialog {

  TabControl Tabs {

    TabItem Before { TextBox Description -Property @{ Width = 377 }}
    TabItem After { TextBox Description2 -Property @{ Width = 377 }}
    
  } -Property @{ MinHeight = 233; MinWidth = 377; }
  
} -Property @{ Title = 'TabItem'; MinHeight = 233; MinWidth = 377; }

.NOTES
https://msdn.microsoft.com/en-us/library/system.windows.controls.tabcontrol
#>
function TabControl {
  [CmdletBinding()]
  Param([string]$Name,
    [Scriptblock]$Contents,
    [hashtable]$Property = @{}
  )
  $baseProperties = @{
  }
  if ($name) {
    $baseProperties.Name = $name
  }
  $tabControl = New-WPFControl -type System.Windows.Controls.TabControl -Properties $baseProperties, $property

  [System.Windows.UIElement[]]$c = & $Contents
  $c | foreach-object {    $tabControl.Items.Add($_) | out-null }
  $tabControl | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $tabControl  | add-member -MemberType NoteProperty -Name HideLabel -Value $True
  $tabControl | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = [Ordered]@{}
    $this.Items | ForEach-Object {if ($_| get-member GetControlValue) {
        $d.Add($_.Name, $_.GetControlValue())
      }
    }
    [pscustomobject]$d
  } -PassThru
}