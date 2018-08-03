Window {
    DockPanel{
    Menu Menus {
        MenuItem TopLevel -contents{
            MenuItem Increment -action { $value.Text=1+$Value.Text}
            MenuItem Decrement -action { $value.Text=-1+$Value.Text}
        }
    }
    Textbox Value -initialValue 100
}
} -ShowForValue