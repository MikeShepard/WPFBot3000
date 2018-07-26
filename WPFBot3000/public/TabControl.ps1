<#
.SYNOPSIS
A tabcontrol (container for tabs)

.DESCRIPTION
A tabcontrol (container for tabs)

.PARAMETER Contents
A scriptblock that outputs tabitem controls to embed in the tabcontrol

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the tabcontrol

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
function TabControl {
    [CmdletBinding()]
    Param([string]$name,
        [Scriptblock]$Contents,
        [hashtable]$Property = @{}
    )
    $baseProperties = @{
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $tabControl = New-WPFControl -type System.Windows.Controls.TabControl -Properties $baseProperties, $property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $tabControl.Items.Add($_) | out-null }
    $tabControl | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tabControl  | add-member -MemberType NoteProperty -Name HideLabel -Value $True
    $tabControl | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = [Ordered]@{}
        $this.Items | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    } -PassThru
}
