ipmo WPFBot3000 -force

$w=Window {
    TextBox Fred
    CheckBox Barney
} -Events @{Name='Barney'
            EventName='Checked'
            Action={
                    $txt=$this.Window.GetControlByName('Fred')
                    write-host $txt.Text
                    $txt.Text=$txt.Text.ToUpper()
                  }
           }


$w.ShowDialog()
