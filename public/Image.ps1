function Image {
    [CmdletBinding()]
    Param($Name, $ImageURI, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    if($ImageURI){
        $baseProperties=@{
          BaseURI=$imageURI
        }
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.Image -Property $properties
    if($ImageURI){
        $imageSource = new-object  System.Windows.Media.Imaging.BitmapImage (new-object  System.Uri $imageURI )
        $o.Source = $imageSource;

    }
     $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru
}