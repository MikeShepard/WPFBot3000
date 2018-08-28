<#
.SYNOPSIS
Overrides the automatic output value of the window (and optionally closes it)

.DESCRIPTION
Provides a value to use as the output of the window instead of looking at control properties
Use the -Close switch to cause the window to close

.PARAMETER Window
The window object

.PARAMETER OutputValue
The value to use as the output of the window

.PARAMETER Close
Closes the window

.EXAMPLE
Dialog {
  
  #TODO
  
} -Property @{ Title = 'Set-WindowOutput'; MinHeight = 233; MinWidth = 377; }
#>
function Set-WindowOutput {
  [CmdletBinding()]
  Param($Window,
    $OutputValue,
    [switch]$Close        )
  if (-not ($window | Get-Member -Name OverrideOutput -MemberType NoteProperty)) {
    $window | Add-Member  -Name OverrideOutput -MemberType NoteProperty -value $outputValue
  }
  else {
    $window.OverrideOutput = $outputValue
  }
  if ($close) {
    $window.DialogResult = $true
  }
}