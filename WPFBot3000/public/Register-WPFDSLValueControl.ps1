<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that has a value

.DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that has a value

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER initialValuePropertyName
The name of the property to use to set the initial value of the control

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLValueControl -Name Txt -Typename System.Windows.Controls.TextBox -initialValuePropertyName Text
Register-WPFDSLValueControl -Name PlainTextPassword -Typename System.Windows.Controls.PasswordBox -initialValuePropertyName Password
Register-WPFDSLValueControl -Name MyCheckBox -TypeName System.Windows.Controls.CheckBox -initialValuePropertyName IsChecked -HideLabel
dialog {
    Txt MyText -InitialValue Blah
    PlainTextPassword MyPass -InitialValue Password
    MyCheckBox Chk -InitialValue $true -property @{Content='Chk'}
    CheckBox Chk2 -InitialValue $true
}
.NOTES
General notes
#>
function Register-WPFDSLValueControl{
    [CmdletBinding()]
    Param($Name, $TypeName,$initialValuePropertyName,[switch]$HideLabel)

    $newWPFControl=Get-Command New-WPFControl
    New-Item -Path "function:global:$Name" -force -Value {
        [CmdletBinding()]
        Param($Name, $InitialValue , $property = @{})
        $baseProperties = @{}
        if($name) {
            $baseProperties.Name=$name
        }

        $o = & $newWPFControl -Type $typename -properties $baseProperties,$property

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
Register-WPFDSLValueControl -Name Txt -Typename System.Windows.Controls.TextBox -initialValuePropertyName Text
Register-WPFDSLValueControl -Name PlainTextPassword -Typename System.Windows.Controls.PasswordBox -initialValuePropertyName Password
Register-WPFDSLValueControl -Name MyCheckBox -TypeName System.Windows.Controls.CheckBox -initialValuePropertyName IsChecked -HideLabel
dialog {
    Txt MyText -InitialValue Blah
    PlainTextPassword MyPass -InitialValue Password
    MyCheckBox Chk -InitialValue $true -property @{Content='Chk'}
    CheckBox Chk2 -InitialValue $true
}
#>