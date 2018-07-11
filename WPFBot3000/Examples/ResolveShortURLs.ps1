#illustrates Hiding controls and the  Set-WindowOutput function (as an alternate solution)
#based on https://jdhitsolutions.com/blog/powershell/6035/making-short-links-long-with-powershell-and-wpf/

$w= Window {
   TextBox -name ShortUrl -property @{Width=300}
   TextBox Resolved -property @{Visibility='Collapsed'}
   Button ResolveBtn -Action{$txt=$this.Window.GetControlByName('ShortUrl')
                          $Resolved =$this.Window.GetControlByName('Resolved')
                          $ResolvedURL=(Invoke-WebRequest -UseBasicParsing -Uri $($txt.Text)).baseresponse.ResponseUri.AbsoluteURI
                          $resolved.Text=$ResolvedURL
                          $this.Window.DialogResult=$true
                          #or, without the hidden control, just override the window output and tell it to close.
                          #Set-WindowOutput -window $this.Window -OutputValue ([PSCustomObject]@{ShortURL=$txt.Text
                          #                                                                    Resolved=$resolvedURL}) -close
   }
} -title 'Link Lookup' -labelMap @{ShortURL='Enter a short url'}
$w.ShowDialog() | out-null
$w.GetWindowOutput()