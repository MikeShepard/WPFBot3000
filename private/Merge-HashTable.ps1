<#
.SYNOPSIS
Adds items from the "Extension" hashtable to the "Base" hashtable

.DESCRIPTION
Used to override a hashtable of base properties and values with customised versions.

.PARAMETER Base
Hashtable with base values

.PARAMETER Extension
Hashtable with overrides of base values or extra properties

.EXAMPLE
$prop1=@{Height=30;Title='Example'}
$prop2=@{Title='Updated'}

Merge-Hashtable -base $prop1 -extension $prop2

Name                           Value
----                           -----
Title                          Updated
Height                         30

#>
function Merge-HashTable {
    [CmdletBinding()]
    Param([Hashtable]$Base,
        [Hashtable]$Extension)

    $out = $Base.Clone()
    foreach ($item in $Extension.GetEnumerator()) {
        $out[$item.Key] = $item.Value
    }
    $out
}
