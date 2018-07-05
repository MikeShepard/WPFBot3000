Import-Module WPFBot3000 -force

Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}