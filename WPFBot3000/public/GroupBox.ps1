<#
.SYNOPSIS
A groupbox control

.DESCRIPTION
Outputs a groupbox control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because groupboxes only have one child)

.PARAMETER Contents
The control(s) contained in the groupbox

.PARAMETER Property
Additional properties to be set on the groupbox.

.PARAMETER Title
The title of the groupbox control.

.PARAMETER name
The name of the groupbox control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
dialog {    $groupbox  {
        TextBox Fred -property @{MinWidth=50}
        TextBox Barney
    } -property     $groupboxBrush='Red  $groupboxThickness=5} -name Flintstones
}

.NOTES
General notes
#>
function GroupBox {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Title,
        [string]$name)
    $baseProperties = @{
        Header = $title
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $groupbox = New-WPFControl -type System.Windows.Controls.GroupBox -Properties $baseProperties, $property

    $c = & $Contents
    if ($c -is [System.Windows.UIElement]) {
        $groupbox.Content = $c
    }
    else {
        $groupbox.Content = StackPanel {$c} -Orientation Vertical -name BuiltInStackPanel
    }
    $groupbox | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $groupbox | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $groupbox | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content | ForEach-Object {if ($_| get-member GetControlValue) {
                $value = $_.GetControlValue()
                if ($_.Name -eq 'BuiltInStackPanel') {
                    return $value
                }
                $d.Add($_.Name, $_.GetControlValue())
            }
            [pscustomobject]$d
        }
    }
    $groupbox  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
