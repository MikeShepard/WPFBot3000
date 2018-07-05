Import-Module WPFBot3000 -force
$w=Window {
      ListBox Items -property @{MinWidth=200;VerticalAlignment='Stretch';HorizontalAlignment='Stretch'} -contents (get-service)
} -hidelabels


$w.ShowDialog() | out-null