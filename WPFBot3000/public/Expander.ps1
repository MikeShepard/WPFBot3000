<#
.SYNOPSIS
An Expander control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Expander class

.DESCRIPTION
Outputs a Expander control, along with control(s) contained in it.  If more than one control is in $Contents, a StackPanel is inserted (because Expanders only have one child)

.PARAMETER Contents
The control(s) contained in the Expander

.PARAMETER Property
Additional properties to be set on the Expander.

.PARAMETER Name
The name of the Expander control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
Dialog {
    Expander  {
        TextBlock "This is a textblock`r`nThis is the second line"
    }  
} @{ Title = 'Expander' }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.expander
#>
function Expander {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $Expander = New-WPFControl -type System.Windows.Controls.Expander -Properties $baseProperties, $Property

    $c = & $Contents
    if ($c -is [System.Windows.UIElement]) {
        $Expander.Content = $c
    }
    else {
        $Expander.Content = StackPanel {$c}
    }
    $Expander | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $Expander | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Content | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($_.Name, $_.GetControlValue())
            }
        }
        [pscustomobject]$d
    }
    $Expander  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
