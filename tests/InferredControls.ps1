Describe "Inferred Controls"{
    Context "Control Input"{
        It "Outputs a control when a control is passed in"{
            $result=new-object System.Windows.Controls.Button | Get-InferredControl
            $result | Should -BeOfType [System.Windows.Controls.Button]
        }
    }
    Context "Text Input"{
       It "Outputs a textbox when there's no match"{
        $result=Get-InferredControl hello 
        $result | Should -BeOfType  [system.windows.controls.textbox]
       }
       It "Outputs a DatePicker when the name ends with Date"{
        $result=Get-InferredControl BirthDate 
        $result | Should -BeOfType  [system.windows.controls.Datepicker]
       }
    }
}