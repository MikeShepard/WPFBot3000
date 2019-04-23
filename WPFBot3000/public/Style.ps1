<#
.SYNOPSIS
    Compare to a Style object...contains Setter objects which say what properties to set to what values
.DESCRIPTION
    Compare to a Style object...contains Setter objects which say what properties to set to what values
.PARAMETER Setters
    A collection of setter objects to add to the style
.PARAMETER Type
    Optionally, the type to apply the style to.  If not supplied, the style will be added to the type of the object that contains this style
.EXAMPLE
    TextBlock -name Name -text Fred -property @{Resources=(style {setter ([System.Windows.Controls.TextBlock]::BackgroundProperty) ([Brushes]::Green)})}
    #use as a value of the Resources key in the property hashtable for a control or a window
.INPUTS
    None
.OUTPUTS
    [System.Windows.Style]
#>function Style {
    [CmdletBinding()]
    param([scriptblock]$Setters,
          $TypeName)
    $style=new-object System.Windows.Style 

     foreach($setter in (& $setters)){
        $style.Setters.Add($setter)
    }
    if($TypeName){
        Add-member -InputObject $style -MemberType NoteProperty -Name TypeToStyle -Value $TypeName
    }
    $style
} 