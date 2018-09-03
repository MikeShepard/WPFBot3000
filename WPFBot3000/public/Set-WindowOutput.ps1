<#
.SYNOPSIS
Overrides the automatic output value of the window (and optionally closes it)

.DESCRIPTION
Provides a value to use as the output of the window instead of looking at control properties.
Use the -Close switch to cause the window to close

.PARAMETER Window
The window object

.PARAMETER OutputValue
The value to use as the output of the window

.PARAMETER Close
Closes the window

.EXAMPLE
Set-WindowOutput -window $this.Window -OutputValue 'Hello' -close

#>
function Set-WindowOutput {
    [CmdletBinding()]
    Param($Window,
          $OutputValue,
          [switch]$Close        )
    if(-not ($window | Get-Member -Name OverrideOutput -MemberType NoteProperty)){
        $window | Add-Member  -Name OverrideOutput -MemberType NoteProperty -value $OutputValue
    } else {
       $window.OverrideOutput=$OutputValue
    }
    if($Close){
        $window.DialogResult = $true
    }
}