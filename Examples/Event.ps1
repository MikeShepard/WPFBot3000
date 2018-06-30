ipmo wpf_dsl -force

$w=Window {
    TextBox Fred
    CheckBox Barney
} -Events @{Name='Barney'
            EventName='Checked'
            Action={$txt=$this.Window.FindControl('Fred')
                    write-host $txt.Text
                    $txt.Text=$txt.Text.ToUpper()
                  }
           }


$w.ShowDialog()