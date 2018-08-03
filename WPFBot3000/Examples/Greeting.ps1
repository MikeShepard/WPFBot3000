# Another button example.

#Import-Module WPFBot3000 -force
$w=Window {
    DataEntryGrid{
    Textbox Name
    Button Personalize -name mike -action {
                                 $Greeting.Content="Hello, $($name.Text)"}
    Label 'Hello, World' -name 'Greeting'
    } -name data
} -ShowForValue