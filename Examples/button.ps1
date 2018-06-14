Import-Module wpf_dsl -force
dialog { 
  button blah -action {$this.Window.Title='Pressed'}
}