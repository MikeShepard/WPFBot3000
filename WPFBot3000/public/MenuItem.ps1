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

.PARAMETER Contents
Other menuitem controls that are nested under this

.PARAMETER Action
The action to be performed when clicking this menu item

.EXAMPLE
#note that the menu here is not lined up well...see menu.ps1 in the examples folder (includes a dockpanel)
Dialog {
    Menu Menus {
        MenuItem TopLevel -contents{
            MenuItem Increment -action { $value.Text=1+$Value.Text}
            MenuItem Decrement -action { $value.Text=-1+$Value.Text}
        }
    }
    Textbox Value -initialValue 100
} 

.NOTES
General notes
#>
function MenuItem {
    [CmdletBinding()]
    Param([string]$label,
          [ScriptBlock]$action,
          [hashtable]$Property = @{},
          [string]$name,
          [Scriptblock]$contents)
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
