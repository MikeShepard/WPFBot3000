function MultiLineTextBox {
    [CmdletBinding()]
    Param([string]$Name,
          [string]$InitialValue = "",
          [string]$property = @{})
    $baseProperties = @{
        Name                        = $name
        Text                        = $InitialValue
        TextWrapping                = "Wrap"
        AcceptsReturn               = "True"
        VerticalScrollBarVisibility = "Visible"
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.TextBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}
