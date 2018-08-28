<#
.SYNOPSIS
A RepeatButton control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Primitives.RepeatButton class

.DESCRIPTION
Outputs a WPF RepeatButton control with a caption and an action.  Note, to set the delay and interval properties, include them in the -Property hashtable

.PARAMETER Caption
The text on the button

.PARAMETER Action
The action performed when the button is clicked

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the control

.EXAMPLE
Dialog {

  TextBox Name
  
  RepeatButton 'Enter a name, then press and hold' -Property @{ Delay = 500 } |
    HandlesEvent Click { $t = $this.Window.GetControlByName('Name'); Write-Host "Hello, $($t.Text)"; }

} -Property @{ Title = 'RepeatButton'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.repeatbutton
#>
function RepeatButton {
  [CmdletBinding()]
  Param([string]$Caption,
    [ScriptBlock]$Action,
    [hashtable]$Property = @{},
    [string]$Name)
  $baseProperties = @{
    Content = $Caption
  }
  if ($name) {
    $baseProperties.Name = $name
  }
  $btn = New-WPFControl -type System.Windows.Controls.Primitives.RepeatButton -Properties $baseProperties, $property

  $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $btn.Add_Click($action)
  $btn
}