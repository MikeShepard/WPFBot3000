<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain any number of items

.DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that can contain any number of items

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLPanelControl -Name Stk -Typename System.Windows.Controls.StackPanel -hidelabel
dialog {
    Stk Items {
                TextBox Name
                TextBox Address
    }
}
.NOTES
General notes
#>
function Register-WPFDSLPanelControl {
    [CmdletBinding()]
    Param([String]$Name, 
        [String]$TypeName, 
        [Switch]$HideLabel)

    $newWPFControl = Get-Command New-WPFControl
    $getControlMethod = Get-Command GetControlByName | Select-Object -expandProperty ScriptBlock

    New-Item -Path "function:global:$Name" -force -Value {
        [CmdletBinding()]
        Param($Name, [ScriptBlock]$Contents , $property = @{})
        $baseProperties = @{
        }
        if ($Name) {
            $baseProperties.Name = $Name
        }
        $panel = & $newWPFControl -type $TypeName -Properties $baseProperties, $property
        [System.Windows.UIElement[]]$c = & $Contents
        $c | foreach-object {    $panel.Children.Add($_) | out-null }
        $panel | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
        $panel | add-member -MemberType ScriptMethod -Name GetControlByName -Value $GetControlMethod
        $panel | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
            $this.Children | ForEach-Object {if ($_| get-member GetControlValue) {
                    $d.Add($_.Name, $_.GetControlValue())
                }}
            if ($d.Count -eq 1) {
                $d.Values| Select-Object -first 1
            }
            else {
                [pscustomobject]$d
            }}
        if ($HideLabel) {
            $panel | add-member -MemberType NoteProperty -Name HideLabel -Value $True
        }
        $panel
    }.GetNewClosure() | out-null
}