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
This function should not be needed as variables for controls are created automatically
#>
function GetControlByName{
    param([string]$name)
    $items = if (Get-Member -InputObject $this -Name Children) {
        $this.Children
    } elseif (Get-Member -InputObject $this -Name ToolBars) {
        $this.ToolBars
    } elseif (Get-Member -InputObject $this -Name Items) {
        $this.Items
    }
    foreach ($item in $items) {
        if ($null -eq $item) { continue }
        if ((Get-Member -InputObject $item -Name Name) -and $item.Name -eq $name) {
            return $item
        }
        if (Get-Member -InputObject $item -Name GetControlByName) {
            $foundItem = $item.GetControlByName($name)
            if ($foundItem) {
                return $foundItem
            }
        }
    }
}