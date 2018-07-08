<#
.SYNOPSIS
Function to find a control in a WPF container recursively

.DESCRIPTION
Function to find a control in a WPF container recursively

.PARAMETER name
The name of the control to find

.EXAMPLE
$control=$this.Window.GetControlByName('FirstName')

.NOTES
General notes
#>
function GetControlByName{
    param([string]$name)
    if(Get-Member -InputObject $this -Name Children){
        foreach($item in $this.Children){
            if($item.Name -eq $name){
                return $item
            } else {
                if(Get-Member -InputObject $item -Name GetControlByName){
                    $foundItem=$item.GetControlByName($name)
                    if($foundItem){
                        return $foundItem
                    }
                }
            }
        }
    }
}