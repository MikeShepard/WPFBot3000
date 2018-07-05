Import-Module WPFBot3000 -force


$w=Dialog {
      Grid -columnCount 3   {
        1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}
      } -Property @{ShowGridlines=$true}
   }

