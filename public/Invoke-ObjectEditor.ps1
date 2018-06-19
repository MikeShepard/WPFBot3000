
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER inputobject
Parameter description

.PARAMETER Property
Parameter description

.PARAMETER LabelMap
Parameter description

.PARAMETER Update
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Invoke-ObjectEditor {
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline = $true)]$inputobject,
        [string[]]$Property,
        [hashtable]$LabelMap = @{},
        [switch]$Update)

    $Controls = $(
        foreach ($item in $inputObject | get-member -name $property -MemberType Properties) {
            $value = $inputobject.$($item.Name)
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
    if ($update) {
        foreach ($item in $out | get-member $Property -MemberType Properties) {
            $inputobject.$($item.Name) = $out.$($item.Name)
        }
        $inputobject
    }
    else {
        $out
    }
}
New-Alias -Name Edit-Object -Value Invoke-ObjectEditor
