# Prototype example with 2 types of controls

Window {
    # TextBox FirstName
    # TextBox LastName
    # TextBox EmailAddress
    DockPanel {
        StatusBar {Label Hi
            Separator
            Label 'From the Statusbar'}  
        DataentryGrid Data {
            DatePicker ReminderDate
            TextBox FirstName
            TextBox LastName
            TextBox EmailAddress
            Button Ok -Action {$this.Window.DialogResult = $true}
        }
    }

 
}  -ShowForValue

