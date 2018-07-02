$path='C:\Users\mike\Pictures\2018-06'

$images=get-childitem $path -INCLUDE  '*.BMP','*.GIF','*.JPG','*.PNG','*.TIFF' -Recurse

$currentImage=0
if ($images.count -eq 0){
    write-error "No images found in $path"
    return
}


$w=window {

    Image Viewer -property @{Height=400} -ImageURI $images[0]
    StackPanel {
                    Button Prev -Action {$this.Window.PreviousImage()}
                    Button Next -Action {$this.Window.PreviousImage()}
    }
} -labelMap @{Prev="<-";Next="->"}

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