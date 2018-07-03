function TabControl {
    [CmdletBinding()]
    Param([Scriptblock]$Contents, $Property = @{}, [ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal', $name)
    $baseProperties = @{
         }
    if ($name) {
        $baseProperties.Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $tabControl = new-object System.Windows.Controls.TabControl -Property $properties
    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $tabControl.Items.Add($_) | out-null }
    $tabControl | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tabControl | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = [Ordered]@{}
        $this.Items | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }} -PassThru
}
