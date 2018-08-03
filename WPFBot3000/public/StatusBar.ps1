<#
.SYNOPSIS
A StatusBar control

.DESCRIPTION
A StatusBar control that contains other controls

.PARAMETER Contents
A scriptblock that outputs controls you want in this StatusBar

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the StatusBar control

.EXAMPLE

.NOTES
General notes
#>
function StatusBar {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$name)
    $baseProperties = @{
       'Dockpanel.Dock'='Bottom'
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $bar = New-WPFControl -type System.Windows.Controls.Primitives.StatusBar -Properties $baseProperties, $property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $bar.Items.Add($_) | out-null }
    $bar | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $bar | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $bar | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Items | ForEach-Object {if (($_| get-member GetControlValue) -and $_.Name) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d

    }
    $bar  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
