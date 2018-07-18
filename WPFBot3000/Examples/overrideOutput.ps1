$w=Window {
    Textbox FirstName #-property @{Width=200;Height=50}
    Textbox LastName
    Calendar Birthday -property @{HorizontalAlignment='Left'}
    Button Close -Action {
                            Set-WindowOutput -window $this.Window -outputValue "$($FirstName.Text) $($lastName.Text) was born $($Birthday.SelectedDate)" -close
                         }
}

$w.ShowForValue()