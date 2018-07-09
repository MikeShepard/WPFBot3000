Dialog {
   TextBox -name ShortUrl -property @{Width=300}
   Button Resolve -Action{$txt=$this.Window.GetControlByName('ShortUrl')
                          $resolved=(Invoke-WebRequest -UseBasicParsing –Uri $($txt.Text)).baseresponse.ResponseUri.AbsoluteURI
                          Set-WindowOutput -window $this.Window -OutputValue ([PSCustomObject]@{ShortURL=$txt.Text 
                                                                                               Resolved=$resolved}) -close
   }
} -title 'Link Lookup' -labelMap @{ShortURL='Enter a short url'}

