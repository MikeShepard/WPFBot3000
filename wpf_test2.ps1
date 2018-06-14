<# $w=window {textbox Fred 'Hello world'}
$output=@{}
$w.ShowDialog()
$w.Content.Child.Children | ForEach-Object { 
      if($_ -and ( get-member GetControlValue -InputObject $_))
      {      $output.Add($_.Name, $_.GetControlValue()) }}
    $output
 #>

ipmo wpf_dsl -force
    dialog {textbox Fred 'Hello world'}