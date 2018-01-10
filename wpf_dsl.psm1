Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

function Merge-HashTable {
    [CmdletBinding()]
    Param([Hashtable]$Base,
        [Hashtable]$Extension)

    $out = $Base.Clone()
    foreach ($item in $Extension.GetEnumerator()) {
        $out[$item.Key] = $item.Value
    }
    $out
}

function Window {
    param([scriptblock]$Contents)
    $w = new-object system.windows.window -Property @{
        SizeToContent = 'HeightandWidth'
    }
    [array]$c = & $Contents
   
    $sp = new-object System.Windows.Controls.StackPanel -Property @{
        Height      = $w.Height
        Orientation = [System.Windows.Controls.Orientation]::Vertical
        Width       = $w.Width
    }
    $w.Content = $sp
    foreach ($control in $c) {
        $sp.Children.Add($control) | out-null
    }
    $output = @{}
    $dialogResult = $w.Showdialog()
    if ($true -or $dialogResult) {
        #$w.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")| ForEach {
        $c | ForEach-Object {       $output.Add($_.Name, $_.GetControlValue()) }
        [pscustomobject]$output
    }
}

function Dialog {
    param([scriptblock]$Contents)
    $w = new-object system.windows.window -Property @{
        SizeToContent = 'WidthAndHeight'
        Margin        = New-object System.Windows.Thickness 10
    }
    [System.Windows.UIElement[]]$c = & $Contents
    $border = new-object system.windows.controls.border -property @{Padding = 10}
    $w.Content = $border
    $grid = new-object System.Windows.Controls.Grid -Property @{
        Height = $w.Height
    }
    1..$C.Count | ForEach-Object { $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height = 'Auto'}))}
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = 'Auto'}))
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = '*'}))
    $border.Child = $grid
    $Row = 0
    foreach ($control in $c) {
        $l = Label $control.Name -property {Width='Auto'; }
        [System.Windows.Controls.Grid]::SetRow($l, $row)
        [System.Windows.Controls.Grid]::SetColumn($l, 0)
        $grid.Children.Add($l) | out-null
     
        [System.Windows.Controls.Grid]::SetRow($control, $row)
        [System.Windows.Controls.Grid]::SetColumn($control, 1)
        $grid.Children.Add($control) | out-null
        $row += 1
    }
    $w.Width = $grid.width
    $output = @{}
    $dialogResult = $w.Showdialog()
    if ($true -or $dialogResult) {
        $c | ForEach-Object {       $output.Add($_.Name, $_.GetControlValue()) }
        [pscustomobject]$output
    }
}

function LabeledControl {
    Param($ctrl, $text) 
    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $text
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $stack.Children.Add((Label $text)) | out-null
    $stack.Children.Add($o) | out-null 
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[1].GetControlValue()} -PassThru                                                    

}
function TextBox {
    Param($Name, $InitialValue = "", $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.TextBox -Property $properties
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}

function Password {
    Param($Name, $InitialValue = "", $property = @{})
    $baseProperties = @{
        Name     = $name
        Password = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.PasswordBox -Property $properties
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Password} -PassThru
}

function Label {
    Param($Text)
    new-object System.Windows.Controls.Label -Property @{ 
        Content = $text
    } 
}

Function FilePicker {
    Param($Name, $InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $t = TextBox -Name "Temp_$name" -InitialValue $InitialValue -property @{IsReadOnly = $true}                                      
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Browse'
        Tag     = $t
    }
    $btn.Add_Click( {
            PAram($sender, $e) 
            $ofd = new-object Microsoft.Win32.OpenFileDialog
            $txt = [System.Windows.Controls.TextBox]$sender.Tag
            if ($txt.Text) {
                $ofd.InitialDirectory = [system.io.path]::GetDirectoryName($txt.Text)
                $ofd.FileName = [system.io.path]::GetFileName($txt.Text)
            }
            if ($ofd.ShowDialog()) {
                $txt.Text = $ofd.FileName
            }
        })
    $stack.Children.Add($btn) | out-null
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].GetControlValue()} -PassThru                                                    

}

Function DirectoryPicker {
    Param($Name, $InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $t = TextBox -Name "Temp_$name" -InitialValue $InitialValue -property @{IsReadOnly = $true}                                      
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Browse'
        Tag     = $t
    }
    $btn.Add_Click( {
            PAram($sender, $e) 
            $ofd = new-object System.Windows.Forms.FolderBrowserDialog
            $txt = [System.Windows.Controls.TextBox]$sender.Tag
            if ($txt.Text) {
                $ofd.SelectedPath = $txt.Text
            }
            if ($ofd.ShowDialog()) {
                $txt.Text = $ofd.SelectedPath
            }
        })
    $stack.Children.Add($btn) | out-null
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].GetControlValue()} -PassThru                                                    

}

Function CredentialPicker {
    Param($Name, [PSCredential]$InitialValue)

    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $name
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }

    $t = TextBox -Name "Temp_$name" -property @{IsReadOnly = $true}   
    if($InitialValue){
        $t.tag=$InitialValue
        $t.text=$initialvalue.GetNetworkCredential().UserName
    } else {
        $t.tag=$null
        $t.text='<none>'
    }
    $stack.Children.Add($t) | out-null
    $btn = new-object System.Windows.Controls.Button -Property @{
        Content = 'Edit'
        Tag     = $t
    }
    $btn.Add_Click( {
            Param($sender, $e) 
            $txt = [System.Windows.Controls.TextBox]$sender.Tag

           $cred=get-credential $txt.tag
           $txt.Tag=$cred
           $txt.Text=$cred.GetNetworkCredential().Username 
        })
    $stack.Children.Add($btn) | out-null
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[0].Tag} -PassThru                                                    

}
function ListBox {
    Param($name, $contents, $initialValue, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property

    $l = new-object System.Windows.Controls.ListBox -Property $properties
  
    $contents | ForEach-Object {$l.Items.Add($_) | out-null } 
    if ($initialValue) {
        $l.SelectedItem = $initialValue
    }
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}

function ComboBox {
    Param($name, $contents, $initialValue, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property
    $l = new-object System.Windows.Controls.ComboBox -Property $properties
    if ($initialValue) {
        $l.SelectedItem = $initialValue
    }
  
    $contents | ForEach-Object {$l.Items.Add($_) | out-null } 
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}


function CheckBox {
    Param($Name, [Boolean]$InitialValue = "", $property = @{})
    $baseProperties = @{
        Name      = $name
        Content   = $Name
        IsChecked = $InitialValue                   
    }
    $properties = Merge-HashTable $baseProperties $property  
    $chk = new-object System.Windows.Controls.CheckBox -Property $properties
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked} -PassThru
}


function DatePicker {
    Param($Name, [DateTime]$InitialValue = "", $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue                   
    }
    $properties = Merge-HashTable $baseProperties $property  
    $dpck = new-object System.Windows.Controls.DatePicker -Property $properties
    $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}
function Invoke-ObjectEditor {
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline = $true)]$inputobject,
        [string[]]$Property, [switch]$Update)

    $Controls = $(
        foreach ($item in $inputObject | get-member -name $property -MemberType Properties) {
            $value = $inputobject.$($item.Name)
            switch ($value.GetType()) {
                'Int32' {TextBox -Name $item.Name -InitialValue $value}
                'String' {TextBox -Name $item.Name -InitialValue $value}
                'bool' {CheckBox -Name $Item.Name -InitialValue $value}
                'DateTime' {TextBox -Name $item.Name -InitialValue $value}
            }
        }
    )

    $out = Dialog {$controls}
    if ($update) {
        foreach ($item in $out | get-member $Property -MemberType Properties) {
            $inputobject.$($item.Name) = $out.$($item.Name)
        }
        $inputobject
    } else {
        $out
    }
}
New-Alias -Name Edit-Object -Value Invoke-ObjectEditor 

<#
#example code
window { TextBox Fred 'hello world'
         TextBox Barney 'hey there!'
         Textbox Bubba 'another textbox' 
         Checkbox Wilma 1
         Combobox Betty Able,Baker,Charlie}  
#>

