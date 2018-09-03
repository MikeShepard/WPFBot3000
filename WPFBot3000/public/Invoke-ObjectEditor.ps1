<#
.SYNOPSIS
POC Function that lets you edit properties of an object

.DESCRIPTION
Builds UI for selected properties (infers control type from property type).  Very limited functionality
Only properties with types that the function can infer will have UI generated for them.

.PARAMETER Inputobject
The object that has properties you want to edit

.PARAMETER Property
The properties you want to edit (wildcards are allowed)

.PARAMETER LabelMap
A hashtable with items of the form PropertyName='Desired label'.  If the property has UI generated it will use this text instead of the property name.


.PARAMETER InPlace
If true, the function sets the properties to the new values on the existing object and outputs nothing.
If false, the function outputs an object with the "Edited" properties.

.EXAMPLE
$a=[PSCustomObject]@{Prop1='A';Prop2=150}
$a | Invoke-ObjectEditor -property Prop1, Prop2

#>
function Invoke-ObjectEditor {
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline = $true)]$inputobject,
        [string[]]$Property,
        [hashtable]$LabelMap = @{},
        [switch]$InPlace)

    $Controls = $(
        foreach ($item in $InputObject | get-member -name $property -MemberType Properties) {
            $value = $Inputobject.$($item.Name)
            switch ($value.GetType()) {
                'Int32' {
                    TextBox -Name $item.Name -InitialValue $value
                }
                'String' {
                    TextBox -Name $item.Name -InitialValue $value
                }
                'bool' {
                    CheckBox -Name $Item.Name -InitialValue $value
                }
                'DateTime' {
                    TextBox -Name $item.Name -InitialValue $value
                }
            }
        }
    )

    $out = Dialog {$controls} -LabelMap $labelMap
    if ($InPlace) {
        foreach ($item in $out | get-member $Property -MemberType Properties) {
            $inputobject.$($item.Name) = $out.$($item.Name)
        }
    }
    else {
        $out
    }
}
New-Alias -Name Edit-Object -Value Invoke-ObjectEditor -Force
