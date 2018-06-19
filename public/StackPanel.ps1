<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Contents
Parameter description

.PARAMETER Property
Parameter description

.PARAMETER Orientation
Parameter description

.PARAMETER name
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function StackPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents, $Property = @{}, [ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal', $name)
    $baseProperties = @{
        Orientation = [System.Windows.Controls.Orientation]$Orientation
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $stack = new-object System.Windows.Controls.StackPanel -Property $properties
    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $stack.Children.Add($_) | out-null }
    $stack | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }} -PassThru
}
