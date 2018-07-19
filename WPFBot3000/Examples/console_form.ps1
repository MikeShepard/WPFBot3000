# An example of a more elaborate layout
# it doesn't really do anything at this point, and the "stretching" isn't quite what I want either

$w=Window {
   Grid -columnCount 3  {
      $script:l=ListBox Items -property @{MinWidth=200;VerticalAlignment='Stretch'} -contents (get-service)
      $l
      GridSplitter -Orientation Horizontal
      Grid -columnCount 1  {
         MultilineTextBox Editor -property @{MinWidth=300;MinHeight=200;MaxHeight=200;HorizontalAlignment='Stretch'}
         TextBox CommandLine -property @{MinWidth=300;Height=20;HorizontalAlignment='Stretch'} -InitialValue Prompt
         MultilineTextBox Output -property @{MinWidth=300;MinHeight=200;FontFamily='Consolas';HorizontalAlignment='Stretch'}

      } -Property @{ShowGridLines=$true;MinHeight=400} -name Right
    } -Property @{ShowGridLines=$true;MinHeight=400;MaxHeight=700;VerticalAlignment='Stretch'} -Name win
} -hidelabels


$w.ShowDialog() | out-null