<#
.SYNOPSIS
A GridSplitter control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.GridSplitter class

.DESCRIPTION
Allows the user to resize rows/columns of a grid

.PARAMETER Orientation
Horizontal/Vertical

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  Grid -ColumnCount 3 {

    GridSplitter -Orientation Vertical -Property @{ 'Grid.Row' = 1; Width = 50; }
    GridSplitter -Orientation Vertical -Property @{ 'Grid.Row' = 2; Width = 50; }

    1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}

  } -Property @{ ShowGridlines = $true }
     
} -Property @{ Title = 'GridSplitter'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.gridsplitter
#>
function GridSplitter {
  [CmdletBinding()]
  Param([ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal',
        [hashtable]$Property = @{})
  if ($orientation -eq 'Horizontal') {
      $baseProperties = @{
          HorizontalAlignment = 'Stretch'
          Width               = 5
          MaxWidth=5
      }
  } else {
      $baseProperties = @{
          VerticalAlignment = 'Stretch'
          Height            = 5
          MaxHeight=5
      }
  }
  $splitter=New-WPFControl -type System.Windows.Controls.GridSplitter -Properties $baseProperties,$property
  $splitter | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru
}