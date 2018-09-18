<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a single control

.DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that can contain a single control

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLContentControl -Name Brd -Typename System.Windows.Controls.Border -hidelabel
dialog {
    Brd Items {
                TextBox Name
                TextBox Address
    }
}

#>
function Register-WPFDSLContentControl {
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
        $o = & $newWPFControl -type $TypeName -Properties $baseProperties, $property

        [System.Windows.UIElement[]]$c = & $Contents
        $c = & $Contents
        if ($c -is [System.Windows.UIElement]) {
            $o.Child = $c
        }
        else {
            $o.Child = StackPanel {$c}
        }
        $o | add-member -MemberType ScriptMethod -Name GetControlByName -Value $getControlMethod
        $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
            $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                    $d.Add($_.Name, $_.GetControlValue())
                }}
            if ($d.Count -eq 1) {
                $d.Values| Select-Object -first 1
            }
            else {
                [pscustomobject]$d
            }}
        if ($HideLabel) {
            $o | add-member -MemberType NoteProperty -Name HideLabel -Value $True
        }
        $o
    }.GetNewClosure() | out-null
}
