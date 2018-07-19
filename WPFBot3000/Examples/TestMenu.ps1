#Example showing a context menu on a control

dialog {
textbox Fred 'Hello' | Add-WPFMenu -items @{UpperCase={
    $Fred.Text=$Fred.Text.ToUpper()}}
 }