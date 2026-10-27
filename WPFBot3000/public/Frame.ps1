<#
.SYNOPSIS
Creates a WPF Frame for navigation.

.DESCRIPTION
Creates a frame that navigates to the supplied content. Navigation completes asynchronously.

.PARAMETER Contents
A scriptblock that outputs the initial content, such as a Page.

.PARAMETER Property
WPF properties to set on the frame. Use Source to navigate to a URI instead of providing Contents.

.PARAMETER Name
The name of the frame.

.EXAMPLE
Frame -Name Main { Page { TextBox FirstName } }

Creates a frame that navigates to a page.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.frame
#>
function Frame {
    [CmdletBinding()]
    param([scriptblock]$Contents, [hashtable]$Property = @{}, [string]$Name)

    if ($Contents -and ($Property.ContainsKey('Source') -or $Property.ContainsKey('Content'))) {
        throw 'Specify Contents or a Source/Content property, not both.'
    }
    $baseProperties = @{}
    if ($Name) { $baseProperties.Name = $Name }
    $frame = New-WPFControl -Type System.Windows.Controls.Frame -Properties $baseProperties, $Property
    Set-WPFNavigationContent -Control $frame -Contents $Contents
    $frame | Add-Member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $frame | Add-Member -MemberType ScriptMethod -Name GetControlValue -Value ${function:Get-WPFNavigationContentValue}
    $frame | Add-Member -MemberType NoteProperty -Name HideLabel -Value $true -PassThru
}
