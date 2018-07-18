# Another button example.

#Import-Module WPFBot3000 -force
$w=Window {
    Textbox Name
    Button Personalize -name mike -action {
                                 $Greeting.Content="Hello, $($name.Text)"}
    Label 'Hello, World' -name 'Greeting'
}
$w.ShowDialog()