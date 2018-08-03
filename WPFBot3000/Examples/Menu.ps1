Window{
    DockPanel {
    Menu Top -contents {
        MenuItem Menu5 -Contents {
            MenuItem Item1 -action {write-host "item1"}
            MenuItem Item2 -action {write-host "item2"}
            Separator
            MenuItem Item3 -action {write-host "item3"}
        }
    }
    DataEntryGrid {
       Textbox Name Mike
    Textbox Name2 Mike
    Textbox Name3 Mike
    } -name Values
    }

} -property @{MinHeight=100;MinWidth=100} -ShowForValue