function Invoke-ObjectEditor {
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline = $true)]$inputobject,
        [string[]]$Property,
        [hashtable]$LabelMap = @{},
        [switch]$InPlace)

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
    if ($InPlace) {
        foreach ($item in $out | get-member $Property -MemberType Properties) {
            $inputobject.$($item.Name) = $out.$($item.Name)
        }
    }
    else {
        $out
    }
}
New-Alias -Name Edit-Object -Value Invoke-ObjectEditor
