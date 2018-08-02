<#
.SYNOPSIS
Creates a WPF control, merging property hashtables and applying attached properties

.DESCRIPTION
Creates a WPF control, merging property hashtables and applying attached properties

.PARAMETER Type
The type of control desired

.PARAMETER Properties
An array of hashtables with properties to be assigned to the newly created object.  The merge is from left to right, so properties in earlier hashtables can be overridden by subsequent hashtables.

.EXAMPLE
An example

.NOTES
General notes
#>
function New-WPFControl {
    [CmdletBinding()]
    Param($Type, [Hashtable[]]$Properties)
    $Resources=$null
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
        } elseif($Key -eq 'Resources'){ 
            $Resources=$out.Resources
            $KeysToRemove.Add($Key) | out-null
        }
    }
    $keysToRemove | ForEach-Object {$out.Remove($_)}
    $o=new-object -TypeName $type -Property $out
    foreach($item in $compoundProperties.GetEnumerator()){
        $typename,$property=$item.Key.Split('.')
        $type=$AttachedPropertyTypes[$typeName]
        $type::"Set$property"($o,$item.Value)
    }
    if($out.ContainsKey('Name') -and $out.Name){
        New-Variable -Name $out.Name -Value $o -Scope Global -force
    }
    if($Resources){
        $resources | foreach-object {
            if($_ | get-member -name TypeToStyle){
                $typeToStyle=$_.TypeToStyle
            } else {
                $typeToStyle=$type
            }
            $o.Resources.Add(($typeToStyle -as [Type]),$_)
        }
    }
    $o
}

