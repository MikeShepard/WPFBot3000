#Example showing a context menu on a control

dialog {
textbox Fred 'Hello' | Add-WPFMenu -items @{UpperCase={
    $txtBox=$this.tag;$txtBox.Text=$txtBox.Text.ToUpper()}}
 }