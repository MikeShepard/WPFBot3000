function Register-WPFDSLitemsControl{
    [CmdletBinding()]
    Param($Name, $TypeName,$initialValuePropertyName,[switch]$HideLabel)

    $newWPFControl=Get-Command New-WPFControl
    New-Item -Path "function:global:$Name" -force -Value {
        [CmdletBinding()]
        Param($Name,[Array]$Contents, $InitialValue , $property = @{})
        $baseProperties = @{}
        if($name) {
            $baseProperties.Name=$name
        }

        $o = & $newWPFControl -Type $typename -properties $baseProperties,$property

        $o.ItemsSource=$contents
        $o.$initialValuePropertyName=$initialValue
        $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
        $o | add-member -name ValuePropertyName -MemberType NoteProperty -Value $initialValuePropertyName
        if($HideLabel){
            $o | add-member -MemberType NoteProperty -Name HideLabel -Value $True
        }
        $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {
                $this.$($this.ValuePropertyName)
                } -PassThru
    }.GetNewClosure() | out-null
}

<#
Register-WPFDSLItemsControl -Name Lst -Typename System.Windows.Controls.ListBox -initialValuePropertyName SelectedItem
$file=dialog {
    $files=get-childitem c:\temp -file | Select-object -first 10
    Lst Files -Content $files -InitialValue $files[2]
}
#>