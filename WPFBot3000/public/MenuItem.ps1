<#
.SYNOPSIS
A MenuItem control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.MenuItem class

.DESCRIPTION
A MenuItem control

.PARAMETER Label
The label of the MenuItem

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the control

.PARAMETER Contents
Other MenuItem controls that are nested under this

.PARAMETER Action
The action to be performed when clicking this menu item

.EXAMPLE
Dialog {

  Menu Menus {

    MenuItem TopLevel -Contents {
      MenuItem Increment |
        HandlesEvent Click {
            $value.Text = 1 + $Value.Text
        }

      MenuItem Decrement |
        HandlesEvent Click {
            $value.Text = 1 - $Value.Text
        }
    }

  }
  Textbox Value -InitialValue 100
} -Property @{ Title = 'MenuItem'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.menuitem
#>
function MenuItem {
  [CmdletBinding()]
  Param([string]$Label,
    [ScriptBlock]$Action,
    [hashtable]$Property = @{},
    [string]$Name,
    [Scriptblock]$Contents)
  $baseProperties = @{}
  if ($label) {
    $baseProperties.Header = $label
    $baseProperties.Name = $label
  }
  if ($name) {
    $baseProperties.Name = $name
  }
  $MenuItem = New-WPFControl -type System.Windows.Controls.MenuItem -Properties $baseProperties, $property
  if ($contents) {
    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {$menuItem.Items.Add($_)| out-null}
  }
  else {
    $MenuItem.Add_Click($action)
  }
  $MenuItem | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}

  $menuItem
}