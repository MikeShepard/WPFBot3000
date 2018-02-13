ipmo wpf_dsl -Force
$files=dir c:\temp
Dialog { 
         TextBox Fred 'hello world' -property @{FontFamily='Comic Sans MS'} 
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox' 
         Checkbox Wilma 1
         FilePicker Duh -initialvalue 'C:\temp\DiagramSettings.psd1'
         DirectoryPicker Duh2 -initialvalue 'C:\temp'
         DatePicker TheDate -initialvalue 1/1/2018
         ListBox List -contents $files -initialValue $files[2]
        }  

$file=dir c:\temp | select-object -first 1

$ob=[PSCustomObject]@{Prop1='hello';Prop2='World'}
Edit-Object $ob -Property Prop1,Prop2 -Update