Import-Module wpf_Dsl -force
Import-Module contextsensitivemenus -force

$w=Dialog {
      Grid -columnCount 3 -RowCount 4  {
        1..12 | ForEach-Object { label -name "Blah$_" -Text "Blah$_"}
      } -Property @{ShowGridlines=$true}
   } 

  