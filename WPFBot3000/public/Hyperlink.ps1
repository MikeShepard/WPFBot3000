<#
.SYNOPSIS
Creates a WPF inline Hyperlink.

.DESCRIPTION
Creates an inline hyperlink for use in a TextBlock. URI navigation is handled by the containing WPF navigation host.

.PARAMETER Text
The link text.

.PARAMETER NavigateUri
The URI to navigate to when the link is activated.

.PARAMETER Property
WPF properties to set on the hyperlink.

.PARAMETER Name
The name of the hyperlink.

.EXAMPLE
TextBlock -Contents { 'Open '; Hyperlink 'details' -NavigateUri 'https://example.com' }

Creates a text block containing a hyperlink.

.LINK
https://learn.microsoft.com/en-us/dotnet/api/system.windows.documents.hyperlink
#>
function Hyperlink {
    [CmdletBinding()]
    param([string]$Text, [uri]$NavigateUri, [hashtable]$Property = @{}, [string]$Name)

    $baseProperties = @{}
    if ($Name) { $baseProperties.Name = $Name }
    if ($NavigateUri) { $baseProperties.NavigateUri = $NavigateUri }
    $link = New-WPFControl -Type System.Windows.Documents.Hyperlink -Properties $baseProperties, $Property
    if ($Text) { $link.Inlines.Add($Text) }
    $link
}
