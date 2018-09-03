<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a list of items

.DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that can contain a list of items

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER initialValuePropertyName
The name of the property to use to set the initial value of the control

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLItemsControl -Name Lst -Typename System.Windows.Controls.ListBox -initialValuePropertyName SelectedItem
$file=dialog {
    $files=get-childitem c:\temp -file | Select-object -first 10
    Lst Files -Content $files -InitialValue $files[2]
}

#>

function Register-WPFDSLitemsControl {
    [CmdletBinding()]
    Param([String]$Name, 
        [String]$TypeName,
        [String]$InitialValuePropertyName,
        [Switch]$HideLabel)

    $newWPFControl = Get-Command New-WPFControl
    New-Item -Path "function:global:$Name" -force -Value {
        [CmdletBinding()]
        Param($Name, [Array]$Contents, $InitialValue , $Property = @{})
        $baseProperties = @{}
        if ($name) {
            $baseProperties.Name = $Name
        }

        $o = & $newWPFControl -Type $typename -properties $baseProperties, $Property

        $o.ItemsSource = $contents
        $o.$InitialValuePropertyName = $InitialValue
        $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
        $o | add-member -name ValuePropertyName -MemberType NoteProperty -Value $initialValuePropertyName
        if ($HideLabel) {
            $o | add-member -MemberType NoteProperty -Name HideLabel -Value $True
        }
        $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {
            $this.$($this.ValuePropertyName)
        } -PassThru
    }.GetNewClosure() | out-null
}
