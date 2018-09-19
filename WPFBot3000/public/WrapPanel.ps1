<#
.SYNOPSIS
A WrapPanel control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.WrapPanel class

.DESCRIPTION
Outputs a WPF WrapPanel control, along with control(s) contained in it

.PARAMETER Contents
A scriptblock that outputs controls you want in this WrapPanel

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Orientation
Horizontal or vertical (how it "stacks" the controls)

.PARAMETER Name
The name of the WrapPanel control

.EXAMPLE
Dialog {
    WrapPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}

.NOTES
https://docs.microsoft.com/en-us/dotnet/api/system.windows.controls.wrappanel
#>
function WrapPanel {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal',
        [string]$Name)
    $baseProperties = @{
        Orientation = [System.Windows.Controls.Orientation]$Orientation
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $stack = New-WPFControl -type System.Windows.Controls.WrapPanel -Properties $baseProperties, $Property

    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object {    $stack.Children.Add($_) | out-null }
    $stack | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = [Ordered]@{}
        $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $stack  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
