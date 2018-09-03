<#
.SYNOPSIS
Registers the typename and property prefix of an attached property

.DESCRIPTION
Registers the typename and property prefix of an attached property. 
for instance, to handle the Grid.Row, attached property
you would register System.Window.Controls.Grid with the prefix Grid.

.PARAMETER TypeName
The name of the type which provides the attached property (like System.Window.Controls.Grid )

.PARAMETER PropertyPrefix
The property prefix of the attached property (like Grid)

.EXAMPLE
Register-WPFAttachedPropertyType -TypeName System.Windows.Controls.DockPanel -PropertyPrefix DockPanel

.NOTES
General notes
#>
function Register-WPFAttachedPropertyType {
    [CmdletBinding()]
    param(
        [string]$TypeName,
        [string]$PropertyPrefix
    )
    $AttachedPropertyTypes[$PropertyPrefix] = $TypeName -as [Type]
}