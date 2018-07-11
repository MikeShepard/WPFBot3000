<#
.SYNOPSIS
A Rectangle control

.DESCRIPTION
A Rectangle control

.PARAMETER Height
The height of the rectangle

.PARAMETER Width
The Width of the rectangle

.PARAMETER Name
The Name of the rectangle control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE

Dialog {
    TextBox FirstName
    Rectangle -Height 100 -Width 100 -property @{Stroke=[System.Windows.Media.Brushes]::Black}
}

.NOTES
General notes
#>
function Rectangle {
    [CmdletBinding()]
    Param($Height,
          $Width,
          [String]$Name,
          [hashtable]$property) 

    $BaseProperties=@{
        Height=$Height
        Width=$Width
    }

    $Rectangle=New-WPFControl -type System.Windows.Shapes.Rectangle -Properties $baseProperties,$property

    if($Name){
        $Rectangle.Name=$Name
    }
    $Rectangle | Add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $Rectangle | Add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}