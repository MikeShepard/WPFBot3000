ipmo wpf_Dsl -force
ipmo contextsensitivemenus -force

$w=Dialog {
      Grid -columnCount 3 -RowCount 4  {
        1..12 | foreach { label -name "Blah$_" -Text "Blah$_"}
      } -Property @{}
   }
