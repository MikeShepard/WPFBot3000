<#
.SYNOPSIS
A Separator control

.DESCRIPTION
A Separator control 

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog{
    DockPanel{
        Menu -contents {
            MenuItem Menu5 -Contents {
            MenuItem Item1 -action {write-host "item1"}
            MenuItem Item2 -action {write-host "item2"}
            Separator 
            MenuItem Item3 -action {write-host "item3"}
            }
        }
    }
} 

.NOTES
General notes
#>
function Separator {
    [CmdletBinding()]
    Param([hashtable]$property = @{})

    $BaseProperties=@{

    }

    $separator=New-WPFControl -type System.Windows.Controls.Separator -Properties $baseProperties,$property
    $separator  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}