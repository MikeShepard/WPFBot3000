<#
.SYNOPSIS
Outputs a window with the indicated wpf controls.

.DESCRIPTION
Creates a window with no implicit structure
Outputs the window without displaying it.
Note, the window doesn't build its own ok/cancel buttons so you are responsible for that.

.PARAMETER Contents
A scriptblock that outputs the controls you want in the window

.PARAMETER Events
An array of hashtables of event handlers for controls in the dialog.  Each should have Name (control name), EventName, and Action.

.PARAMETER Title
The window title

.PARAMETER Property
A hashtable of properties to set on the window

.PARAMETER ShowForValue
Switch to say whether you want the window immediately shown (showdialog()) and if OK pressed
to output the "calculated output of the window".  Window with -ShowForValue works similarly to 
Dialog function but doesn't automatically add Ok and Cancel button.

.EXAMPLE
Dialog {
  
  #TODO
  
} -Property @{ Title = 'New-WPFBotBareWindow'; MinHeight = 233; MinWidth = 377; }

$w.ShowDialog();

#>
function New-WPFBotBareWindow {
  [CmdletBinding()]
  param([scriptblock]$Contents,
    [hashtable[]]$Events,
    [string]$Title,
    [hashtable]$Property,
    [Switch]$ShowForValue)
  $baseProperties = @{
    SizeToContent = 'WidthAndHeight'
    Margin        = 10
  }
  $w = New-WPFControl -type system.windows.window -properties $BaseProperties, $property 
  $w.Content = & $contents 
  $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {
    Param($name)
    $this.Content.GetControlByName($name)
  }
  $w | add-member -MemberType ScriptMethod -Name ShowForValue -Value {
    if ($this.ShowDialog()) {
      if ($this | Get-Member OverrideOutput) {
        $This.OverrideOutput
      }
      else {
        $this.GetWindowOutput()
      }
    }
  }
  $w | add-member -MemberType ScriptMethod -Name GetWindowOutput -value {
    if ($this | Get-Member -Name OverrideOutput -MemberType NoteProperty) {
      return $this.OverrideOutput
    }
    $output = $this.Content.GetControlValue()
    [PSCustomObject]$output
  }

  $control = $null
  foreach ($item in $events) {
    $control = $w.GetControlByName($item.Name)
    if ($control) {
      $control."Add_$($item.EventName)"($item.Action)
    }
  }
  if ($title) {
    $w.Title = $title
  }
  if ($ShowForValue) {
    $w.ShowForValue()
  }
  else {
    $w
  }

}

New-Alias -Name BareWindow -Value New-WPFBotBareWindow -force