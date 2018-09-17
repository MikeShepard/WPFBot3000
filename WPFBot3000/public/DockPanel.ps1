<#
.SYNOPSIS
A DockPanel control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.DockPanel class

.DESCRIPTION
A DockPanel control

.PARAMETER Contents
The control(s) contained in the DockPanel

.PARAMETER Name
The name of the DockPanel control

.PARAMETER Property
Additional properties to be set on the DockPanel

.EXAMPLE
Dialog {
  DockPanel {Label Bottom -Property @{ 'DockPanel.Dock' = 'Bottom'; background = 'Yellow' }
            Label Right -Property @{ 'DockPanel.Dock' = 'Right'; background = 'Red' }
            Label Top -Property @{ 'DockPanel.Dock' = 'Top'; background = 'Green' }
            Label Left -Property @{ 'DockPanel.Dock' = 'Left'; background = 'Blue' }
            Label Center -property @{ HorizontalAlignment='Center'; VerticalAlignment='Center'; }
  } -Name SampleDockPanel -Property @{ Height = 233; }
 } -Property @{ Title = 'DockPanel'; MinHeight = 377; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.dockpanel
#>
function DockPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents, $Name, $Property = @{})

    $baseProperties = @{
        LastChildFill=$True
     }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $dock = New-WPFControl -type System.Windows.Controls.DockPanel -Properties $baseProperties, $Property

    if ($Contents) {
        [System.Windows.UIElement[]]$c = & $Contents
        $c | foreach-object { $dock.Children.Add($_) | Out-Null }
    }
    $dock | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $dock | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $dock | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if (($_| get-member GetControlValue) -and $_.Name) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $dock  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}

