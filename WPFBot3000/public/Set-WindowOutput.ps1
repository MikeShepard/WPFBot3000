<#
.SYNOPSIS
Overrides the automatic output value of the window (and optionally closes it)

.DESCRIPTION
Provides a value to use as the output of the window instead of looking at control properties.
Use the -Close switch to cause the window to close.

.PARAMETER Window
The window object

.PARAMETER outputValue
The value to use as the output of the window

.PARAMETER close
-Close means to close the window.

.EXAMPLE
Set-WindowOutput -window $this.Window -OutputValue 'Hello' -close

.NOTES
General notes
#>
function Set-WindowOutput {
    [CmdletBinding()]
    Param($Window,
          $outputValue,
          [switch]$close        )
    if(-not ($window | Get-Member -Name OverrideOutput -MemberType NoteProperty)){
        $window | Add-Member  -Name OverrideOutput -MemberType NoteProperty -value $outputValue
    } else {
       $window.OverrideOutput=$outputValue
    }
    if($close){
        $window.DialogResult = $true
    }
}