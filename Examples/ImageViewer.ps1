$path='~\Pictures\'

$images=get-childitem $path -INCLUDE  '*.BMP','*.GIF','*.JPG','*.PNG','*.TIFF' -Recurse

$currentImage=0
if ($images.count -eq 0){
    write-error "No images found in $path"
    return
}


$w=window {

    Image Viewer -property @{Height=400;MaxWidth=600} -ImageURI $images[0]
    StackPanel {
                    Button '<-' -name Prev -Action {$this.Window.PreviousImage()}
                    Button '->' -name Next -Action {$this.Window.NextImage()}
    }
}

$w | add-member -MemberType ScriptMethod -Name NextImage -Value {$image=$this.GetControlByName('Viewer')
                                                                 $script:currentImage=($currentImage +1) % $images.Count
                                                                 write-host ($images[$currentImage])
                                                                 $image.LoadImage($images[$currentImage].FullName)
                                                                }
$w | add-member -MemberType ScriptMethod -Name PreviousImage -Value {$image=$this.GetControlByName('Viewer')
                                                                $script:currentImage=($currentImage -1) % $images.Count
                                                                write-host ($images[$currentImage])
                                                                $image.LoadImage($images[$currentImage].FullName)
                                                               }

$w.ShowDialog() | out-null