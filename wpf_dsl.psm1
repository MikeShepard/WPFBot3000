Add-Type -AssemblyName PresentationFramework


function Window{
param([scriptblock]$Contents)
   $w=new-object system.windows.window -Property @{
                                                    height=600
                                                    Width=250
                                                  }
   [array]$c=& $Contents
   $sp=new-object System.Windows.Controls.StackPanel -Property @{
                                                                    Height=$w.Height
                                                                    Orientation=[System.Windows.Controls.Orientation]::Vertical
                                                                    Width=$w.Width
                                                                }
   $w.Content=$sp
   foreach($control in $c){
     $sp.Children.Add($control) | out-null
   }
   $output=@{}
   $dialogResult=$w.Showdialog()
   if($true -or $dialogResult){
        #$w.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")| ForEach {
      $c | foreach{       $output.Add($_.Name, $_.GetControlValue()) }
      [pscustomobject]$output
   }
}

function LabeledControl{
Param($ctrl,$text) 
  $stack=new-object System.Windows.Controls.StackPanel -Property @{width=225
                                                                    Height=50
                                                                    Name=$text
                                                                    Orientation=[System.Windows.Controls.Orientation]::Horizontal
                                                                  }
   $stack.Children.Add((Label $text)) | out-null
   $stack.Children.Add($o) | out-null 
   $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[1].GetControlValue()} -PassThru                                                    

}
function TextBox{
Param($Name,$InitialValue="")
   
  $o=new-object System.Windows.Controls.TextBox -Property @{
                                                                width=100
                                                                Height=50
                                                                Name=$name
                                                                Text=$InitialValue
                                                            } 
   $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} 
   LabeledControl -ctrl $o -text $Name 
  
}
function Label {
Param($Text)
  new-object System.Windows.Controls.Label -Property @{ 
                                                        Content=$text
                                                        BorderThickness=1
                                                     } 
}

function CheckBox{
Param($Name,[Boolean]$InitialValue="")
    $chk=new-object System.Windows.Controls.CheckBox -Property @{
                                                                Name=$Name 
                                                                width=100
                                                                Height=50
                                                                Content=$Name
                                                                IsChecked=$InitialValue
                                                            } 
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked} -PassThru
}

<#
#example code
window { TextBox Fred 'hello world'
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox' 
         Checkbox Wilma 1}  
#>

