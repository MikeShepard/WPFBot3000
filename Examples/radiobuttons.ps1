Dialog {
    StackPanel -Name Options -orientation Horizontal {
       RadioButton Eeny -groupName Options
       RadioButton Meeny -InitialValue $true -groupName Options
       RadioButton Miny  -groupName Options
    }
    TextBox Moe
}