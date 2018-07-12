<#
.SYNOPSIS
A ScrollViewer control

.DESCRIPTION
Outputs a ScrollViewer control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because ScrollViewers only have one child)

.PARAMETER Contents
The control(s) contained in the ScrollViewer

.PARAMETER Property
Additional properties to be set on the ScrollViewer.

.PARAMETER name
The name of the ScrollViewer control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
dialog {
    ScrollViewer  {
        TextBox Fred -property @{MinWidth=50}
        TextBox Barney
    } -property @{ScrollViewerBrush='Red';ScrollViewerThickness=5} -name Flintstones
}

.NOTES
General notes
#>
function ScrollViewer {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [string]$name)
    $baseProperties = @{
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $ScrollViewer=New-WPFControl -type System.Windows.Controls.ScrollViewer -Properties $baseProperties,$property

    $c = & $Contents
    if($c -is [System.Windows.UIElement]){
        $ScrollViewer.Content=$c
    } else {
        $ScrollViewer.Content =StackPanel {$c}
    }
    $ScrollViewer | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $ScrollViewer | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $ScrollViewer | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($this.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
        $ScrollViewer  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
