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