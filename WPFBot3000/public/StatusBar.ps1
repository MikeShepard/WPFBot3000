<#
.SYNOPSIS
A StatusBar control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Primitives.StatusBar class

.DESCRIPTION
A StatusBar control that contains other controls

.PARAMETER Contents
A scriptblock that outputs controls you want in this StatusBar

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the StatusBar control

.EXAMPLE
Dialog {
    DockPanel {
        StatusBar -Name Status {
            Label Status
        } -Property @{ 'DockPanel.Dock' = 'Bottom' }
        Label Right Property @{ 'DockPanel.Dock' = 'Right' }
        Label Top -Property @{ 'DockPanel.Dock' = 'Top' }
        Label Left -Property @{ 'DockPanel.Dock' = 'Left' }
        Label Center -Property @{ HorizontalAlignment = 'Center'; VerticalAlignment = 'Center'; }
    } -Name DockPanel -Property @{ Height = 233 }
} -Property @{ Title = 'StatusBar' }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.statusbar
#>
function StatusBar {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{
        'Dockpanel.Dock' = 'Bottom'
    }
    if ($Name) {
        $baseProperties.Name = $Name
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


