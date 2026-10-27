<#
.SYNOPSIS
Creates a WPF Page for navigation.

.DESCRIPTION
Creates a page containing one control or a vertical stack of controls.

.PARAMETER Contents
A scriptblock that outputs the page content.

.PARAMETER Property
WPF properties to set on the page.

.PARAMETER Name
The name of the page.

.EXAMPLE
Page -Name Details { TextBox FirstName }

Creates a page containing a text box.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.page
#>
function Page {
    [CmdletBinding()]
    param([scriptblock]$Contents, [hashtable]$Property = @{}, [string]$Name)

    $baseProperties = @{}
    if ($Name) { $baseProperties.Name = $Name }
    $page = New-WPFControl -Type System.Windows.Controls.Page -Properties $baseProperties, $Property
    Set-WPFNavigationContent -Control $page -Contents $Contents
    $page | Add-Member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $page | Add-Member -MemberType ScriptMethod -Name GetControlValue -Value ${function:Get-WPFNavigationContentValue}
    $page | Add-Member -MemberType NoteProperty -Name HideLabel -Value $true -PassThru
}
