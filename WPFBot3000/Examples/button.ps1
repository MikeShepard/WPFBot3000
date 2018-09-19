# An example of a button with an action.
# Also, uses the property parameter of Dialog to set the font to Comic Sans (sorry!)

dialog {
  button blah -action {$this.Window.Title='Pressed'}
}  -property @{FontFamily='Comic Sans MS';MinWidth=250}