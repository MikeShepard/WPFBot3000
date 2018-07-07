
function New-WPFControl {
    [CmdletBinding()]
    Param($Type, [Hashtable[]]$Properties)
 
    $out = $Properties[0].Clone()
    foreach ($Extension in ($properties | select-object -skip 1)) {
        foreach ($item in $Extension.GetEnumerator()) {
            $out[$item.Key] = $item.Value
        }
    }
    $compoundProperties=@{}
    $keysToRemove=New-object System.Collections.ArrayList
    foreach ($key in $out.Keys) {
        if ($Key.Contains('.')) {
            $compoundProperties.Add($Key,$out[$key])
            $KeysToRemove.Add($Key) | out-null
        }
    }
    $keysToRemove | ForEach-Object {$out.Remove($_)}
    $o=new-object -TypeName $type -Property $out
    foreach($item in $compoundProperties.GetEnumerator()){
        $typename,$property=$item.Key.Split('.')
        $type=get-WPFType $typename
        $type::"Set$property"($o,$item.Value)
    }
    $o
}

