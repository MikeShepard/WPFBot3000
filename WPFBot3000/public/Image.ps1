<#
.SYNOPSIS
An image control

.DESCRIPTION
An Image control

.PARAMETER Name
The name of the control

.PARAMETER ImageURI
What image to display (in uri/path form)

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {
    Image -ImageUri C:\temp\Picture.png
}

.NOTES
General notes
#>
function Image {
    [CmdletBinding()]
    Param([string]$Name,
          [string]$ImageURI,
          [hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.Image -Property $properties
    $o | add-member -Name LoadImage -MemberType ScriptMethod -Value {param($URI)
                                                                        $imageSource=new-object System.Windows.Media.Imaging.BitmapImage (new-object  System.Uri $URI )
                                                                        $this.Source=$imageSource
                                                                    }
    if($ImageURI){
        $o.LoadImage($ImageURI)

    }
     $o | add-member -Name HideLabel -MemberType NoteProperty -Value $true
     $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru
}