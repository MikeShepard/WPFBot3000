(Window {
    TextBox Name
    RepeatButton "Say Hello" -Action {$t=$this.Window.GetControlByName('Name');
                                                  Write-Host "Hello, $($t.Text) : $(Get-date)"}
}).ShowDialog()