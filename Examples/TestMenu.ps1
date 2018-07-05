Import-Module WPFBot3000 -force

dialog {
textbox Fred 'Hello' | Add-WPFMenu -items @{UpperCase={
    $txtBox=$this.tag;$txtBox.Text=$txtBox.Text.ToUpper()}}
 }