$files=Get-ChildItem c:\temp -file | Select-Object -first 5

dialog {
    ListView -name Lv -contents $files -displayProperty Name,Length
} -Events @{Name='lv';EventName='SelectionChanged';Action={
    write-host ($this.SelectedItem)
}}