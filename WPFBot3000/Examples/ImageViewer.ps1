#somewhat complex example involving buttons and script-level data/function

$path='~\Pictures\'

$images=get-childitem $path -INCLUDE  '*.BMP','*.GIF','*.JPG','*.PNG','*.TIFF' -Recurse

$currentImage=0
if ($images.count -eq 0){
    write-error "No images found in $path"
    return
}

Function ChangeImage {
    Param($delta)
    $image=$w.GetControlByName('Viewer')
    $script:currentImage=($currentImage +$delta) % $images.Count
    write-host ($images[$currentImage])
    $image.LoadImage($images[$currentImage].FullName)
}

$w=window {

    Image Viewer -property @{Height=400;MaxWidth=600} -ImageURI $images[0]
    StackPanel {
                    Button '<-' -name Prev -Action {ChangeImage -1}
                    Button '->' -name Next -Action {ChangeImage +1}
    }
}

$w.ShowDialog() | out-null