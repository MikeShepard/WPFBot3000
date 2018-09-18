<#
.SYNOPSIS
A Border control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Border class

.DESCRIPTION
Outputs a border control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because borders only have one child)

.PARAMETER Contents
The control(s) contained in the border

.PARAMETER Property
Additional properties to be set on the border.

.PARAMETER Name
The name of the border control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
Dialog {
    Border  {
        TextBox Fred -Property @{ MinWidth = 50 }
        TextBox Barney
    } -property @{ BorderBrush = 'Red'; BorderThickness = 5 } -name Flintstones
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.border
#>
function Border {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{}
    if ($name) {
        $baseProperties.Name = $name
    }
    $border = New-WPFControl -type System.Windows.Controls.Border -Properties $baseProperties, $property

    $c = & $Contents
    if ($c -is [System.Windows.UIElement]) {
        $border.Child = $c
    }
    else {
        $border.Child = StackPanel {$c}
    }

    $border | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $border | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($this.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
    $border  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
