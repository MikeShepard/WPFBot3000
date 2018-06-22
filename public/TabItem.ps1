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
function TabItem {
    [CmdletBinding()]
    Param($label,[Scriptblock]$Contents, $Property = @{}, $name)
    $baseProperties = @{
      }
    if($label) {
        $baseProperties.Header=$label
        $baseProperties.Name=$label
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $tabitem = new-object System.Windows.Controls.TabItem -Property $properties
    [System.Windows.UIElement[]]$c = & $Contents
    $tabItem.Content = StackPanel -Contents { $c }
    $tabItem | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $tabitem | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content.GetControlValue()
    } -PassThru
}
