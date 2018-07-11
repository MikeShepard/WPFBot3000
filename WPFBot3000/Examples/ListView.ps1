$files=dir c:\temp -file | select -first 5 

dialog {
    ListView -name Lv -contents $files -displayProperty Name,Length
} -Events @{Name='lv';EventName='SelectionChanged';Action={
    write-host ($this.SelectedItem)
}}