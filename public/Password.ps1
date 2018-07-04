function Password {
    [CmdletBinding()]
    Param([string]$Name,
          [SecureString]$InitialValue,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name           = $name
        SecurePassword = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.PasswordBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SecurePassword} -PassThru
}