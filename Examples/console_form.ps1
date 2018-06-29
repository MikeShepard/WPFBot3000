Import-Module wpf_Dsl -force
$w=Window {
   Grid -columnCount 2 -RowCount 1 {
      $script:l=ListBox Items -property @{Width=300;;VerticalAlignment='Stretch';Margin='5,0,0,5'} -contents (get-service)
      $l
      Grid -columnCount 1 -RowCount 3 {
         MultilineTextBox Editor -property @{MinWidth=300;MinHeight=200;MaxHeight=200;HorizontalAlignment='Stretch'}
         TextBox CommandLine -property @{MinWidth=300;Height=20;HorizontalAlignment='Stretch'} -InitialValue Prompt
         MultilineTextBox Output -property @{MinWidth=300;MinHeight=200;FontFamily='Consolas';HorizontalAlignment='Stretch'}

      } -Property @{ShowGridLines=$true;MinHeight=400;VerticalAlignment='Stretch';HorizontalAlignment='Stretch';Margin='5,0,0,5'} -name Right
    } -Property @{ShowGridLines=$true;MinHeight=400;MaxHeight=700;VerticalAlignment='Stretch';Margin='5,0,0,5'} -Name win
} -hidelabels



$w.ShowDialog() | out-null