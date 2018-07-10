#example showing POC of Edit-Object (Invoke-ObjectEditor) command

$ob=[PSCustomObject]@{Prop1='hello';Prop2='World'}
Edit-Object $ob -Property Prop1,Prop2 -Update
