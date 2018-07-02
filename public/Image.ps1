function Image {
    [CmdletBinding()]
    Param($Name, $ImageURI, $property = @{})
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
     $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru
}