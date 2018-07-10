Some big-picture design ideas in the module

Simple Controls (prototype - TextBox.ps1)

- Have a -Property parameter so users can set properties
- Use the New-WPFControl function to create the control (and set properties)
- If the control has a "value" add a GetControlValue() script method that returns the value
  - For instance, the GridSplitter control doesn't have a value that a user would care about (as output)
- Implement a GetWindow() scriptmethod so event handlers can get to other controls easier
- If it makes sense to set properties, put them in a $baseProperties hashtable that gets passed to New-WPFControl
- Make sure to output the control
- If the control shouldn't have a label generated (like checkboxes or radio buttons), add a HideLabel property (doesn't matter what it's set to)

Panels  (prototype - StackPanel.ps1)

- Include a scriptblock parameter to build the list of controls in the panel
- All of the above are still true
- Use the GetControlValue() function in StackPanel as a guide to how to build the appropriate output

Content Controls (prototype - Border.ps1)

- Even though these technically allow only 1 child control, fake it
  - If there are more than one, inject a Stackpanel to contain the controls
  - Make sure to take into account the Stackpanel in the GetControlOutput() method

