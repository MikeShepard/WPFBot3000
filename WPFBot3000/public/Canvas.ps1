<#
.SYNOPSIS
A canvas control

.DESCRIPTION
A canvas control that contains other controls which can be positioned with absolute coordinates using Canvas.Top/Left attached properties

.PARAMETER Contents
A scriptblock that outputs controls you want in this canvas

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The name of the canvas control

.EXAMPLE
Window {
    Canvas {
       CheckBox Eeny -property @{'Canvas.Left'=50}
       CheckBox Meeny  -property @{'Canvas.Left'=50; 'Canvas.Top'=50}
       CheckBox Miny -property @{'Canvas.Left'=50; 'Canvas.Top'=50}
    } -property @{Width=400;Height=400}
} -ShowForValue

.Link
https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.canvas
#>
function Canvas {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{}
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $canvas = New-WPFControl -type System.Windows.Controls.Canvas -Properties $baseProperties, $Property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $canvas.Children.Add($_) | out-null }
    $canvas | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $canvas | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = [Ordered]@{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d

    }
    $canvas  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
