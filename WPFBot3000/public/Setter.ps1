function Setter {
    [CmdletBinding()]
    param([System.Windows.DependencyProperty]$PropertyReference,
          $value)
    $o=new-object System.Windows.Setter -ArgumentList $PropertyReference,$value   
    $o

}