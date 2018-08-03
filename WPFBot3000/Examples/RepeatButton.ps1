Dialog {

    TextBox Name
    RepeatButton "Say Hello" -Action {
                       Write-Host "Hello, $($Name.Text) : $(Get-date)"}
} 