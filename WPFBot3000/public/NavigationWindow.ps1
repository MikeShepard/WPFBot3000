<#
.SYNOPSIS
Creates a WPF NavigationWindow.

.DESCRIPTION
Creates a window that navigates to the supplied content. Navigation completes asynchronously.

.PARAMETER Contents
A scriptblock that outputs the initial content, such as a Page.

.PARAMETER Property
WPF properties to set on the window. Use Source to navigate to a URI instead of providing Contents.

.PARAMETER Name
The name of the window.

.EXAMPLE
NavigationWindow -Name Main { Page { TextBox FirstName } }

Creates a navigation window without showing it.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.navigation.navigationwindow
#>
function NavigationWindow {
    [CmdletBinding()]
    param([scriptblock]$Contents, [hashtable]$Property = @{}, [string]$Name)

    if ($Contents -and ($Property.ContainsKey('Source') -or $Property.ContainsKey('Content'))) {
        throw 'Specify Contents or a Source/Content property, not both.'
    }
    $baseProperties = @{}
    if ($Name) { $baseProperties.Name = $Name }
    $window = New-WPFControl -Type System.Windows.Navigation.NavigationWindow -Properties $baseProperties, $Property
    Set-WPFNavigationContent -Control $window -Contents $Contents
    $window | Add-Member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $window | Add-Member -MemberType ScriptMethod -Name GetWindowOutput -Value ${function:Get-WPFNavigationContentValue} -PassThru
}
