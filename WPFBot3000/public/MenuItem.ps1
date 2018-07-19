<#
.SYNOPSIS
A Menuitem control 

.DESCRIPTION
A Menuitem control 

.PARAMETER label
The label of the MenuItem

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the control

.EXAMPLE
Dialog {
    MenuControl Menus {
        MenuItem Before { TextBox Description -prop @{MinWidth=100;MinHeight=100} }
        MenuItem After { TextBox Description2 -prop @{MinWidth=100;MinHeight=100}}
    }
}

.NOTES
General notes
#>
function MenuItem {
    [CmdletBinding()]
    Param([string]$label,
          [hashtable]$Property = @{},
          [string]$name,
          [Scriptblock]$contents,
          [ScriptBlock]$action)
    $baseProperties = @{}
    if($label) {
        $baseProperties.Header=$label
        $baseProperties.Name=$label
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $MenuItem=New-WPFControl -type System.Windows.Controls.MenuItem -Properties $baseProperties,$property
    if($contents){
        [System.Windows.UIElement[]]$c = & $Contents
        $c | foreach-object {$menuItem.Items.Add($_)| out-null}
    } else {
       $MenuItem.Add_Click($action)
    }
    $MenuItem | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}

    $menuItem
}
