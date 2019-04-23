using namespace System.Windows.Media

$w=window {
    TextBlock -name Name -text Fred -property @{Resources=(style {setter ([System.Windows.Controls.TextBlock]::BackgroundProperty) ([Brushes]::Green)})}
    TextBlock -name Name2 -text Blah -property @{BackGround='Yellow'}
    TextBlock -name Name3 -text Blah2
    TextBox -name Name4 -initialvalue Hah!
} -property @{Resources=(style {setter BackgroundProperty ([Brushes]::Red) } TextBox),
(style {setter BackgroundProperty ([Brushes]::Blue) })
}


$w.ShowDialog()

#first textblock will be blue because of the explicit local style
#second will  be yellow because it is explicitly set
#third will be blue because of the window-level style
#fourth control (a textbox) will be red because of window-level style

