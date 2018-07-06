Function  Bottom {
    [CmdletBinding()]
    Param([scriptblock]$contents)
       $c=& $contents
       $c | foreach-object {[System.Windows.Controls.DockPanel]::SetDock($_,'Bottom')}
       $c
}