# Prototype example with 2 types of controls

$w=BareWindow {
   # TextBox FirstName
   # TextBox LastName
   # TextBox EmailAddress
   DockPanel{
    StatusBar {Label Hi
               Separator
               Label 'From the Statusbar'}  
      DatePicker ReminderDate
    }

 
} 

[System.Windows.Controls.Dockpanel]::SetDock($blah,'Bottom')
$w.ShowDialog()