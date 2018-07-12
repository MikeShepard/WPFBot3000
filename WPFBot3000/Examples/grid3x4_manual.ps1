# Simple example showing how to put items in a grid manually.  
# Rows that don't have anything in them will automatically collapse (they are sized to their contents)

Dialog {
      Grid -columnCount 3 -rowCount 4 -Manual  {
        Label Hello -property @{'Grid.Column'=2;'Grid.Row'=0}
        Label Hello -property @{'Grid.Column'=0;'Grid.Row'=1}
        Label Hello -property @{'Grid.Column'=1;'Grid.Row'=2}
        Label Hello -property @{'Grid.Column'=2;'Grid.Row'=3}
      } -property @{ShowGridLines=$true}
   }

