<#
.SYNOPSIS
A TabItem control (a tab in a TabControl) that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TabItem class

.DESCRIPTION
A TabItem control (a tab in a TabControl)

.PARAMETER label
The label of the tab

.PARAMETER Contents
A scriptblock that outputs controls you want in the tab

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the control

.EXAMPLE
Dialog {
    TabControl Tabs {
        TabItem Before { TextBox Description -prop @{MinWidth=100;MinHeight=100} }
        TabItem After { TextBox Description2 -prop @{MinWidth=100;MinHeight=100}}
    }
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.tabitem
#>
function TabItem {
    [CmdletBinding()]
    Param([string]$label,
        [Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{}
    if ($label) {
        $baseProperties.Header = $label
        $baseProperties.Name = $label
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $tabItem = New-WPFControl -type System.Windows.Controls.TabItem -Properties $baseProperties, $property
    [System.Windows.UIElement[]]$c = & $Contents
    $tabItem.Content = StackPanel -Contents { $c }
    $tabitem  | add-member -MemberType NoteProperty -Name HideLabel -Value $True
    $tabitem | add-member -Name GetControlValue -MemberType ScriptMethod -Value {
        $this.Content.GetControlValue()
    } -PassThru
}
