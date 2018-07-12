
dialog {
    ScrollViewer  {
        StackPanel {
            CheckBox Barney 
            ListBox Fred -contents (get-service)
        } -name Controls -Orientation Vertical
    } -name Flintstones -Property @{MaxHeight=600}
}