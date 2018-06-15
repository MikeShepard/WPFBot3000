Import-Module wpf_dsl -Force
$files=get-childitem c:\temp | Select-Object -first 5
 Dialog{ 
         TextBox Fred 'hello world' -property @{FontFamily='Comic Sans MS'} 
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox' 
         Checkbox Wilma 1
         FilePicker Duh -initialvalue 'C:\temp\DiagramSettings.psd1'
         DirectoryPicker Duh2 -initialvalue 'C:\temp'
         DatePicker TheDate -initialvalue 1/1/2018
       Get-ChildItemontents $files -initialValue $files[2]
        }  


$ob=[PSCustomObject]@{Prop1='hello';Prop2='World'}
Edit-Object $ob -Property Prop1,Prop2 -Update


$o=Dialog {StackPanel -name Blah -contents {LAbel Fred;TextBox Barney -InitialValue Blah!
                                         LAbel Fred2;TextBox Barney2 -InitialValue Blah2!
                                        }}

                                        $o=Dialog {StackPanel -name Blah -contents {Label Fred;TextBox Barney -InitialValue Blah!
                                
                                        }}