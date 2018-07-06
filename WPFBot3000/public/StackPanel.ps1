<#
.SYNOPSIS
A stackpanel control

.DESCRIPTION
A stackpanel control that contains other controls

.PARAMETER Contents
A scriptblock that outputs controls you want in this stackpanel

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Orientation
Horizontal or vertical (how it "stacks" the controls)

.PARAMETER name
The name of the stackpanel control

.EXAMPLE
Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}

.NOTES
General notes
#>
function StackPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal',
          [string]$name)
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
    $stack | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
        $stack  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}