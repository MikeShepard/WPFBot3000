<#
.SYNOPSIS
A ViewBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ViewBox class

.DESCRIPTION
Outputs a ViewBox control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because ViewBoxes only have one child)

.PARAMETER Contents
The control(s) contained in the ViewBox

.PARAMETER Property
Additional properties to be set on the ViewBox.

.PARAMETER Name
The name of the ViewBox control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
Dialog {
    ViewBox  {
        Image -imageuri c:\users\mike\pictures\powershell_startmenu.png

    } -name Flintstones
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.viewbox
#>
function ViewBox {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{
        Stretch  = 'Uniform'
        MaxWidth = 400
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $ViewBox = New-WPFControl -type System.Windows.Controls.ViewBox -Properties $baseProperties, $Property

    $c = & $Contents
    if ($c -is [System.Windows.UIElement]) {
        $ViewBox.Child = $c
    }
    else {
        $ViewBox.Child = StackPanel {$c}
    }
    $ViewBox | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $ViewBox | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }

        }
        [pscustomobject]$d
    }
    $ViewBox  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}