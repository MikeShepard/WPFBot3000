<#
.SYNOPSIS
Creates a WPF ToolBar containing controls.

.DESCRIPTION
Creates a ToolBar whose items are produced by a scriptblock.

.PARAMETER Contents
A scriptblock that outputs the toolbar items.

.PARAMETER Property
Properties to set on the toolbar.

.PARAMETER Name
The name of the toolbar.

.EXAMPLE
ToolBar -Name Actions {
    Button Refresh -Action { Write-Host 'Refresh' }
}

Creates a toolbar with a button.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.toolbar
#>
function ToolBar {
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
    $bar = New-WPFControl -Type System.Windows.Controls.ToolBar -Properties $baseProperties, $Property
    if ($Contents) {
        foreach ($item in (& $Contents)) {
            $bar.Items.Add($item) | Out-Null
        }
    }
    $bar | Add-Member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $bar | Add-Member -MemberType ScriptMethod -Name GetControlValue -Value {
        $values = [ordered]@{}
        foreach ($item in $this.Items) {
            if ($null -ne $item -and (Get-Member -InputObject $item -Name GetControlValue) -and
                (Get-Member -InputObject $item -Name Name) -and $item.Name) {
                $values.Add($item.Name, $item.GetControlValue())
            }
        }
        [pscustomobject]$values
    }
    $bar | Add-Member -MemberType NoteProperty -Name HideLabel -Value $true -PassThru
}
