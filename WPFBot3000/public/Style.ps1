function Style {
    [CmdletBinding()]
    param([scriptblock]$Setters,
          $TypeName)
    $style=new-object System.Windows.Style 

    foreach($setter in (& $setters)){
        $style.Setters.Add($setter)
    }
    if($TypeName){
        Add-member -InputObject $style -MemberType NoteProperty -Name TypeToStyle -Value $TypeName
    }
    $style
}