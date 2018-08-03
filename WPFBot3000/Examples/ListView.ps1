$files=Get-ChildItem c:\windows -file | Select-Object -first 5

dialog {
    ListView -name Lv -contents $files -displayProperty Name,Length | HandlesEvent -EventName SelectionChanged -Action { write-Host ($this.SelectedItem)}
}
