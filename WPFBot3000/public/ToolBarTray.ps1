<#
.SYNOPSIS
Creates a WPF ToolBarTray containing toolbars.

.DESCRIPTION
Creates a ToolBarTray whose toolbars are produced by a scriptblock.

.PARAMETER Contents
A scriptblock that outputs ToolBar controls.

.PARAMETER Property
Properties to set on the toolbar tray.

.PARAMETER Name
The name of the toolbar tray.

.EXAMPLE
ToolBarTray -Name Tools {
    ToolBar -Name Actions {
        Button Refresh -Action { Write-Host 'Refresh' }
    }
}

Creates a tray with one toolbar.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.toolbartray
#>
function ToolBarTray {
    [CmdletBinding()]
    param(
        [scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name
    )

    $baseProperties = @{}
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $tray = New-WPFControl -Type System.Windows.Controls.ToolBarTray -Properties $baseProperties, $Property
    if ($Contents) {
        foreach ($bar in (& $Contents)) {
            $tray.ToolBars.Add($bar) | Out-Null
        }
    }
    $tray | Add-Member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $tray | Add-Member -MemberType ScriptMethod -Name GetControlValue -Value {
        $values = [ordered]@{}
        foreach ($bar in $this.ToolBars) {
            if ((Get-Member -InputObject $bar -Name GetControlValue) -and $bar.Name) {
                $values.Add($bar.Name, $bar.GetControlValue())
            }
        }
        [pscustomobject]$values
    }
    $tray | Add-Member -MemberType NoteProperty -Name HideLabel -Value $true -PassThru
}
