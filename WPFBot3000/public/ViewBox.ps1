<#
.SYNOPSIS
A ViewBox control

.DESCRIPTION
Outputs a ViewBox control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because ViewBoxes only have one child)

.PARAMETER Contents
The control(s) contained in the ViewBox

.PARAMETER Property
Additional properties to be set on the ViewBox.

.PARAMETER name
The name of the ViewBox control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
dialog {
    ViewBox  {
        Image -imageuri c:\users\mike\pictures\powershell_startmenu.png

    } -name Flintstones
}

.NOTES
General notes
#>
function ViewBox {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [string]$name)
    $baseProperties = @{
        Stretch='Uniform'
        MaxWidth=400
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $ViewBox=New-WPFControl -type System.Windows.Controls.ViewBox -Properties $baseProperties,$property

    $c = & $Contents
    if($c -is [System.Windows.UIElement]){
        $ViewBox.Child=$c
    } else {
        $ViewBox.Child =StackPanel {$c}
    }
    $ViewBox | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $ViewBox | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $ViewBox | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($this.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
        $ViewBox  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
