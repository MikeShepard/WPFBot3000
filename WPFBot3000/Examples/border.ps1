# Example of a border control.  Note that there are 2 items in the border even though only 1 is "really" allowed.
# the border control injects a stackpanel if you put more than one control inside it.

dialog {
    Border {
        DataEntryGrid Boxes {
            TextBox Fred -property @{MinWidth = 50}
            TextBox Barney
        } 
    } -property @{BorderBrush = 'Red'; BorderThickness = 5} -name Flintstones
}