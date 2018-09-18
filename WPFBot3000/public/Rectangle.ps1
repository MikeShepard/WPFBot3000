<#
.SYNOPSIS
A Rectangle control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Shapes.Rectangle class

.DESCRIPTION
A Rectangle control

.PARAMETER Height
The height of the rectangle

.PARAMETER Width
The Width of the rectangle

.PARAMETER Name
The Name of the rectangle control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE

Dialog {
    TextBox FirstName
    Rectangle -Height 100 -Width 100 -property @{Stroke=[System.Windows.Media.Brushes]::Black}
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.shapes.rectangle
#>
function Rectangle {
    [CmdletBinding()]
    Param($Height,
          $Width,
          [String]$Name,
          [hashtable]$Property)
    $BaseProperties=@{
        Height=$Height
        Width=$Width
    }
    if($Name){
        $BaseProperties.Name=$Name
    }
    $Rectangle=New-WPFControl -type System.Windows.Shapes.Rectangle -Properties $baseProperties,$property

    $Rectangle | Add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}