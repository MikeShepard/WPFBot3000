<#
.SYNOPSIS
Looks in types imported from the WPF assembly and returns one that matches the name requested

.DESCRIPTION
Returns a type object from the WPF assembly with a given name

.PARAMETER typename
the name of the desired type

.EXAMPLE
Get-WPFType -typename Button

#outputs [System.Windows.Controls.Button]

.NOTES
General notes
#>
function Get-WPFType{
    [CmdletBinding()]
    Param($typename)

    if($script:TypeCache.ContainsKey($typename)){
        $script:TypeCache[$typeName]
    } else {
        $type=$script:WPFTypes | Where-Object Name -eq $typeName
        if ($type){
            $script:TypeCache[$typename]=$type
            $type
        } else {
            throw "Type $Typename not found"
        }
    }
}