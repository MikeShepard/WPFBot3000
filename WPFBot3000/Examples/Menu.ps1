Dialog{
    DockPanel{
        Menu -contents {
            MenuItem Menu5 -Contents {
            MenuItem Item1 -action {write-host "item1"}
            MenuItem Item2 -action {write-host "item2"}
            Separator 
            MenuItem Item3 -action {write-host "item3"}
            }
        }
    }
} -property @{MinHeight=100;MinWidth=100}