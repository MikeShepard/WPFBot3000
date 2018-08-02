$w=window {
    TextBlock -name Name -text Fred -property @{Resources=(style {setter ([System.Windows.Controls.TextBlock]::BackgroundProperty) ([System.Windows.Media.Brushes]::Green)})}
    TextBlock -name Name2 -text Blah -property @{BackGround='Yellow'}
    TextBlock -name Name3 -text Blah2
    TextBox -name Name4 -initialvalue Hah!
} -property @{Resources=(style {setter ([System.Windows.Window]::BackgroundProperty) ([System.Windows.Media.Brushes]::Red) } System.Windows.Controls.TextBox),
                        (style {setter ([System.Windows.Window]::BackgroundProperty) ([System.Windows.Media.Brushes]::Blue) })}


$w.ShowDialog()

#-property @{Resources=(style {setter ([System.Windows.Window]::BackgroundProperty) ([System.Windows.Media.Brushes]::Red),
#    setter ([System.Windows.Controls.TextBox]::BackgroundProperty) ([System.Windows.Media.Brushes]::White) System.Windows.Controls.TextBox})}
