Function Right {
    [CmdletBinding()]
    Param([scriptblock]$contents)
       $c=& $contents
       $c | foreach-object {[System.Windows.Controls.DockPanel]::SetDock($_,'Right')}
       $c
}
