# Example showing how to add an event to an object.

$w=Window {
    TextBox Fred
    CheckBox Barney
} -Events @{Name='Barney'
            EventName='Checked'
            Action={
                    $Fred.Text=$txt.Text.ToUpper()
                  }
           }


$w.ShowDialog()
