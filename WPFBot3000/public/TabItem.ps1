<#
.SYNOPSIS
A tabitem control (A tab in a TabControl)

.DESCRIPTION
A tabitem control (A tab in a TabControl)

.PARAMETER label
The label of the tab

.PARAMETER Contents
A scriptblock that outputs controls you want in the tab

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the control

.EXAMPLE
Dialog {
    TabControl Tabs {
        TabItem Before { TextBox Description -prop @{MinWidth=100;MinHeight=100} }
        TabItem After { TextBox Description2 -prop @{MinWidth=100;MinHeight=100}}
    }
}

.NOTES
General notes
#>
function TabItem {
    [CmdletBinding()]
    Param([string]$label,
          [Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [string]$name)
    $baseProperties = @{}
    if($label) {
        $baseProperties.Header=$label
        $baseProperties.Name=$label
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $tabItem=New-WPFControl -type System.Windows.Controls.TabItem -Properties $baseProperties,$property
    [System.Windows.UIElement[]]$c = & $Contents
    $tabItem.Content = StackPanel -Contents { $c }
    $tabItem | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tabitem  | add-member -MemberType NoteProperty -Name HideLabel -Value $True
    $tabitem | add-member -Name GetControlValue -MemberType ScriptMethod -Value { $this.Content.GetControlValue()
    } -PassThru
}
