function Get-InferredControl {
    [Cmdletbinding()]
    Param([Parameter(ValueFromPipeline = $True)]$Item)
    process {
        write-verbose "Inferring control for $item"
        if ($item -is [System.Windows.DependencyObject]) {
            return $item
        } 
        if($item -is [Hashtable]){
            [string]$controlName=$item.Keys[0]
            $controlContents=$item[$controlName]
            Combobox -name $item.Keys[0] -Contents $controlContents
        } elseif($item.Endswith('Date')){
            DatePicker -name $Item
        }
        else{
            TextBox -Name $item 
        }
    }
}