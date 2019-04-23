<#
.SYNOPSIS
      Setter object, used inside a style
.DESCRIPTION
      Setter object, used inside a style, contains a property reference (either from a specific control or from the window) and a value
.EXAMPLE
      (style {setter BackgroundProperty ([Brushes]::Red) }
      #this style/setter says that the background property should be red.
.INPUTS
      None
.OUTPUTS
      [System.Windows.Setter]
#>
function Setter {
    [CmdletBinding()]
    param([object]$PropertyReference,
          $value)
    if(-not($PropertyReference -is [System.Windows.DependencyProperty])){
          $PropertyReference=[System.Windows.Window]::$PropertyReference
    }
    $o=new-object System.Windows.Setter -ArgumentList $PropertyReference,$value   
    $o

 }