<#
.SYNOPSIS
    Create a control whose type is inferred by the input
.DESCRIPTION
    If the input is already a WPF object (DependencyObject), Get-InferredControl will output it unaltered.
    If the input is a hashtable, the output will be a combobox control named after the first key, with the corresponding values as items.
    If the input is a string ending in Date, the output will be a DatePicker
    Otherwise, the output will be a textbox.
.EXAMPLE
    PS C:\> & {'hello';'world'} | Get-InferredControl
    #    ouptuts two textboxes with names of hello and world
.INPUTS
    Get-InferredControl accepts objects on the pipeline.
.OUTPUTS
    Various
#>
function Get-InferredControl {
    [Cmdletbinding()]
    Param(
        #The item to infer a control from
        [Parameter(ValueFromPipeline = $True)]$Item)
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