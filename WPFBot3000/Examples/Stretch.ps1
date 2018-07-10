#Example showing stretching layout

$w=Window {
      ListBox Items -property @{MinWidth=200;VerticalAlignment='Stretch';HorizontalAlignment='Stretch'} -contents (get-service)
} -hidelabels


$w.ShowDialog() | out-null