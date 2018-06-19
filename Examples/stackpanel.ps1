Import-Module wpf_dsl -force

Dialog {
    StackPanel -Name Options -orientation Horizontal {
       CheckBox Eeny
       CheckBox Meeny
       CheckBox Miny
    }
    TextBox Moe
}