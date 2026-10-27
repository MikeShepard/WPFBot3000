<#
.SYNOPSIS
Creates a WPF WebBrowser control.

.DESCRIPTION
Creates an embedded WebBrowser. Use its Source property or Navigate method to load a page. The control uses the legacy Internet Explorer engine.

.PARAMETER Property
WPF properties to set on the browser.

.PARAMETER Name
The name of the browser.

.EXAMPLE
WebBrowser -Name Browser -Property @{ Source = 'https://example.com' }

Creates a browser and navigates to a URI.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.webbrowser
#>
function WebBrowser {
    [CmdletBinding()]
    param([hashtable]$Property = @{}, [string]$Name)

    $baseProperties = @{}
    if ($Name) { $baseProperties.Name = $Name }
    $browser = New-WPFControl -Type System.Windows.Controls.WebBrowser -Properties $baseProperties, $Property
    $browser | Add-Member -MemberType NoteProperty -Name HideLabel -Value $true -PassThru
}
