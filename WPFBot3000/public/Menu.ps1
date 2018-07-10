<#
.SYNOPSIS
A Menu 

.DESCRIPTION
A Menu 

.PARAMETER Contents
A scriptblock that outputs MenuItem controls to embed in the Menu

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The name of the Menu

.EXAMPLE


.NOTES
General notes
#>
function Menu {
    [CmdletBinding()]
    Param([string]$name,
          [Scriptblock]$Contents,
          [hashtable]$Property = @{}
          )
    $baseProperties = @{
           'DockPanel.Dock'='Top'
         }
    if ($name) {
        $baseProperties.Name = $name
    }
    $Menu=New-WPFControl -type System.Windows.Controls.Menu -Properties $baseProperties,$property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $Menu.Items.Add($_) | out-null }
    $Menu | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $Menu  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
    
}
