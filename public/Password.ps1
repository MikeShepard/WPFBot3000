<#
.SYNOPSIS
A password control

.DESCRIPTION
A password control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The password to be loaded initially. Note that this is a secureString

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    Password SAPassword
} -title 'Enter the SA Password'

.NOTES
General notes
#>
function Password {
    [CmdletBinding()]
    Param([string]$Name,
          [SecureString]$InitialValue,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name           = $name

    }
    if($initialValue){
        $BaseProperties.SecurePassword = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.PasswordBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SecurePassword} -PassThru
}