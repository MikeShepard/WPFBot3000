<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    Example of how to use this cmdlet
.EXAMPLE
    Another example of how to use this cmdlet
#>
function Register-WPFAttachedPropertyType{
    [CmdletBinding()]
    param(
        [string]$TypeName,
        [string]$PropertyPrefix
    )
    $AttachedPropertyTypes[$PropertyPrefix]=$TypeName -as [Type]
}