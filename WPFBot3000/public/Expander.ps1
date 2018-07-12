<#
.SYNOPSIS
A Expander control

.DESCRIPTION
Outputs a Expander control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because Expanders only have one child)

.PARAMETER Contents
The control(s) contained in the Expander

.PARAMETER Property
Additional properties to be set on the Expander.

.PARAMETER name
The name of the Expander control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
dialog {
    Expander  {
        TextBlock "This is a textblock`r`nThis is the second line"
    }  
}

.NOTES
General notes
#>
function Expander {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [string]$name)
    $baseProperties = @{
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $Expander=New-WPFControl -type System.Windows.Controls.Expander -Properties $baseProperties,$property

    $c = & $Contents
    if($c -is [System.Windows.UIElement]){
        $Expander.Content=$c
    } else {
        $Expander.Content =StackPanel {$c}
    }
    $Expander | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $Expander | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $Expander | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($this.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
        $Expander  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
