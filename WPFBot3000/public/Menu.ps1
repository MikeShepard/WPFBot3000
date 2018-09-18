<#
.SYNOPSIS
A Menu control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Menu class

.DESCRIPTION
A Menu control

.PARAMETER Contents
A scriptblock that outputs MenuItem controls to embed in the Menu

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the Menu

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
    TextBox Value -InitialValue 100
}
.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.menu

#>
function Menu {
    [CmdletBinding()]
    Param([string]$Name,
        [Scriptblock]$Contents,
        [hashtable]$Property = @{}
    )
    $baseProperties = @{
        'DockPanel.Dock'    = 'Top'
        HorizontalAlignment = 'Left'
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $Menu = New-WPFControl -type System.Windows.Controls.Menu -Properties $baseProperties, $Property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $Menu.Items.Add($_) | out-null }
    $Menu  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
