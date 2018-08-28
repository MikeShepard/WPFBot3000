<#
.SYNOPSIS
A Separator control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Separator class

.DESCRIPTION
A Separator control 

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
  DockPanel {
    Menu -Contents {
      MenuItem Menu5 -Contents {
        
        MenuItem Item1 |
          HandlesEvent Click { Write-Host 'Item1' }

        MenuItem Item2 |
          HandlesEvent Click { Write-Host 'Item2' }

        Separator 
        
        MenuItem Item3 |
          HandlesEvent Click { Write-Host 'Item3' }
      }
    }
  }
} -Property @{ Title = 'Separator'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.separator
#>
function Separator {
  [CmdletBinding()]
  Param([hashtable]$Property = @{})

  $BaseProperties=@{

  }

  $separator=New-WPFControl -type System.Windows.Controls.Separator -Properties $baseProperties,$property
  $separator  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}