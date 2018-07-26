<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER Contents
Parameter description

.PARAMETER name
Parameter description

.PARAMETER property
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function DockPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents, $name, $property = @{})


    $baseProperties = @{

    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $dock = New-WPFControl -type System.Windows.Controls.DockPanel -Properties $baseProperties, $property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $dock.Children.Add($_) | out-null }
    $dock | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $dock | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $dock  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}

