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
