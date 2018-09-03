<#
.SYNOPSIS
A GroupBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.GroupBox class

.DESCRIPTION
Outputs a GroupBox control, along with control(s) contained in it.  If more than one control is in $Contents, a stackpanel is inserted (because groupboxes only have one child)

.PARAMETER Contents
The control(s) contained in the GroupBox

.PARAMETER Property
Additional properties to be set on the GroupBox.

.PARAMETER Title
The title of the GroupBox control.

.PARAMETER Name
The name of the GroupBox control.  The name will be used as a property name in the output of the Dialog function.

.EXAMPLE
Dialog {    
        Groupbox  {
        TextBox Fred -property @{MinWidth = 50}
        TextBox Barney -property @{MinWidth = 50}
    } -property     @{BorderBrush = 'Red' ;BorderThickness = 5} -Name Flintstones
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.groupbox

#>
function GroupBox {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
        [hashtable]$Property = @{},
        [string]$Title,
        [string]$Name)
    $baseProperties = @{
        Header = $title
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $groupbox = New-WPFControl -type System.Windows.Controls.GroupBox -Properties $baseProperties, $Property

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
