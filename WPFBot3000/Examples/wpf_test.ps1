#another example with several kinds of controls

$files=get-childitem c:\temp | Select-Object -first 5
 Dialog{
         TextBox Fred 'hello world' -property @{FontFamily='Comic Sans MS'}
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox'
         Checkbox Wilma 1
         FilePicker Duh -initialvalue 'C:\temp\DiagramSettings.psd1'
         DirectoryPicker Duh2 -initialvalue 'C:\temp'
         DatePicker TheDate -initialvalue 1/1/2018
         ListBox -contents $files -initialValue $files[2]
        }

