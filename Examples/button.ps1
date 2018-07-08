Import-Module WPFBot3000 -force
dialog {
  button blah -action {$this.Window.Title='Pressed'}
}  -property @{FontFamily='Comic Sans MS'}