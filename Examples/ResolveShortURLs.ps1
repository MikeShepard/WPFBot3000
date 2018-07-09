#illustrates the Set-WindowOutput function
#based on https://jdhitsolutions.com/blog/powershell/6035/making-short-links-long-with-powershell-and-wpf/

$w= Window {
   TextBox -name ShortUrl -property @{Width=300}
   Button Resolve -Action{$txt=$this.Window.GetControlByName('ShortUrl')
                          $resolved=(Invoke-WebRequest -UseBasicParsing -Uri $($txt.Text)).baseresponse.ResponseUri.AbsoluteURI
                          Set-WindowOutput -window $this.Window -OutputValue ([PSCustomObject]@{ShortURL=$txt.Text 
                                                                                               Resolved=$resolved}) -close
   }
} -title 'Link Lookup' -labelMap @{ShortURL='Enter a short url'}
$w.ShowDialog() | out-null
$w.GetWindowOutput()