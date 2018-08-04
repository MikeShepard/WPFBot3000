Dialog {
    #individually styled TextBlock
    TextBlock -name Name -text Fred -property @{Resources=(style {setter ([System.Windows.Controls.TextBlock]::BackgroundProperty) ([System.Windows.Media.Brushes]::Green)})}

    #explicit property overrides any style
    TextBlock -name Name2 -text Blah -property @{BackGround='Yellow'}

    #inherits window-level style
    TextBlock -name Name3 -text Blah2

    #inherits window-level style for textboxes
    TextBox -name Name4 -initialvalue Hah!
} -property @{Resources=(
                        #window-level style for textboxes
                        style {setter ([System.Windows.Window]::BackgroundProperty) ([System.Windows.Media.Brushes]::Red) } System.Windows.Controls.TextBox),
                        #window-level style for everything that has Background 
                        (style {setter ([System.Windows.Window]::BackgroundProperty) ([System.Windows.Media.Brushes]::Blue) })}




