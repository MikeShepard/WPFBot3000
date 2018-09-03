<#
.SYNOPSIS
A Separator control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Separator class

.DESCRIPTION
A Separator control 

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog{
    DockPanel{
        Menu -contents {
            MenuItem Menu5 -Contents {
            MenuItem Item1 -action {Write-Host "item1"}
            MenuItem Item2 -action {Write-Host "item2"}
            Separator 
            MenuItem Item3 -action {Write-Host "item3"}
            }
        }
    }
} 

.LINK
General notes	https://msdn.microsoft.com/en-us/library/system.windows.controls.separator
#>
function Separator {
    [CmdletBinding()]
    Param([hashtable]$Property = @{})

    $BaseProperties = @{}

    $separator = New-WPFControl -type System.Windows.Controls.Separator -Properties $baseProperties, $Property
    $separator  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}