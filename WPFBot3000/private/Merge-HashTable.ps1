<#
.SYNOPSIS
Adds the entries in the "extension" hashtable to the "base" hashtable, potentially overwriting the base entries.

.DESCRIPTION
Adds the entries in the "extension" hashtable to the "base" hashtable, potentially overwriting the base entries.

.PARAMETER Base
The original hashtable

.PARAMETER Extension
Hashtable with entries to extend or overwrite the base hashtable

.EXAMPLE
An example

.NOTES
General notes
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
