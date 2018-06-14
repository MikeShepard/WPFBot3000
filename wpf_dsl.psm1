Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

$window=new-object System.Collections.Stack 3 

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
    param([scriptblock]$Contents,
    [hashtable]$labelMap=@{})
    $w = new-object system.windows.window -Property @{
        SizeToContent = 'WidthAndHeight'
        Margin        = New-object System.Windows.Thickness 10
    }
    $script:Window.Push($w)
    [System.Windows.UIElement[]]$c = & $Contents
    $border = new-object system.windows.controls.border -property @{Padding = 10}
    $w.Content = $border
    $grid = new-object System.Windows.Controls.Grid -Property @{
        Height = $w.Height
    }
    1..$C.Count+1 | ForEach-Object { $grid.RowDefinitions.Add( (new-object System.Windows.Controls.RowDefinition -Property @{Height = 'Auto'}))}
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = 'Auto'}))
    $grid.ColumnDefinitions.Add((new-object System.Windows.Controls.ColumnDefinition -property @{Width = '*'}))
    $border.Child = $grid
    $Row = 0
    foreach ($control in $c) {
        if(-not ($control -is [System.Windows.Controls.CheckBox])){
        $labelText=$Control.Name
        if($labelMap.ContainsKey($control.Name)){
            $labelText=$labelMap[$control.Name]
        }
        $l = Label $labelText -property {Width='Auto'; }
        [System.Windows.Controls.Grid]::SetRow($l, $row)
        [System.Windows.Controls.Grid]::SetColumn($l, 0)
        $grid.Children.Add($l) | out-null
        }
        [System.Windows.Controls.Grid]::SetRow($control, $row)
        [System.Windows.Controls.Grid]::SetColumn($control, 1)
        $grid.Children.Add($control) | out-null
        $row += 1
    }
    $w| add-Member -MemberType ScriptMethod -Name GetControlByName -Value {Param($name) $this.Content.Child.Children | where Name -eq $Name}         
    $w.Width = $grid.width
    $w
    
}
function Window2 {
    param([scriptblock]$Contents,
    [hashtable]$labelMap=@{},
    [hashtable[]]$Events)
    $w=Window -contents $Contents -labelMap $labelMap
    foreach($item in $events){
       $control=$w.Content.Child.Children | where Name -eq $item.Name
       if($control){
         $control."Add_$($item.EventName)"($item.Action) 
       }
    }
    
    $w
}
function Dialog {
    param([scriptblock]$Contents,
    [hashtable]$labelMap=@{})
    $c=& $contents
    $w=Window { 
                $c
                StackPanel {Button OK {  $script:Window.Peek().DialogResult=$true } -property @{Margin='5,5,5,5'}
                Button Cancel { $script:Window.Peek().DialogResult=$false} -property @{Margin='5,5,5,5'}
                } -Orientation Horizontal
                }  
    $w.Width = $grid.width
    $output = @{}
    $dialogResult = $w.Showdialog()
    if ($dialogResult) {
        $c | ForEach-Object { if($_ | get-member GetControlValue){      $output.Add($_.Name, $_.GetControlValue()) }}
        [pscustomobject]$output
    }
    #$script:window.Pop() | out-null
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
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}


function MultiLineTextBox {
    Param($Name, $InitialValue = "", $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue
        TextWrapping="Wrap"
        AcceptsReturn="True"
        VerticalScrollBarVisibility="Visible"
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.TextBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}

function Password {
    Param($Name, [SecureString]$InitialValue, $property = @{})
    $baseProperties = @{
        Name     = $name
        SecurePassword = $InitialValue
    }
    $properties = Merge-HashTable $baseProperties $property
    $o = new-object System.Windows.Controls.PasswordBox -Property $properties
    $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SecurePassword} -PassThru
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
    $stack | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
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

           $cred=CredentialDialog $txt.tag
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
  
    $contents | ForEach-Object {
                $lvi=new-object System.Windows.Controls.ListBoxItem 
                $lvi.Tag=$_
                $lvi.Content=$_.ToString()
                $l.Items.Add($lvi) | out-null 
                if ($initialValue -and $_ -eq $initialValue) {
                    $l.SelectedItem = $lvi
                }
        } 
     $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
     $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}

function Add-TreeviewContents{
Param($parent,$items)
    foreach($item in $items){
      if($item -is [Hashtable]){
        foreach($h in ([hashtable]$item).GetEnumerator()){
            $node=New-object System.Windows.Controls.TreeViewItem -Property @{Header=$h.Name}
            $Node.Tag=$h.Name
            $newNode=$parent.Items.Add($node)
            Add-TreeViewContents -parent $Node -items $h.Value
            $node.ExpandSubtree()
        }
      } else {
        $node=New-object System.Windows.Controls.TreeViewItem -Property @{Header=$item.ToString()}
        $node.Tag=$item
        $parent.Items.Add($node) | out-null
      }
    }

}
function Treeview {
    Param($name, $contents, $initialValue, $property = @{})
    $baseProperties = @{
        Name = $name
    }
    $properties = Merge-HashTable $baseProperties $property

    $tree = new-object System.Windows.Controls.TreeView -Property $properties
  
    Add-TreeviewContents -parent $tree -items $contents
    $tree | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $tree | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
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
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$this.SelectedItem} -PassThru
}


function CheckBox {
    Param($Name, [Boolean]$InitialValue = $false, $property = @{})
    $baseProperties = @{
        Name      = $name
        Content   = $Name
        IsChecked = $InitialValue                   
    }
    $properties = Merge-HashTable $baseProperties $property  
    $chk = new-object System.Windows.Controls.CheckBox -Property $properties
    $chk | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $chk | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.IsChecked} -PassThru
}

function StackPanel{
Param([Scriptblock]$Contents,$Property=@{},[ValidateSet('Horizontal','Vertical')]$Orientation='Horizontal',$name)
    $baseProperties = @{
        Orientation = [System.Windows.Controls.Orientation]$Orientation
    }
    if($name){
      $baseProperties.Name=$name
    }
    $properties = Merge-HashTable $baseProperties $property  
    $stack = new-object System.Windows.Controls.StackPanel -Property $properties
    [System.Windows.UIElement[]]$c = & $Contents
    $c | foreach-object{    $stack.Children.Add($_) | out-null }
    $stack | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d=@{}
                                                                               $this.Children | ForEach-Object{if($_| get-member GetControlValue){$d.Add($_.Name,$_.GetControlValue())}} 
                                                                               if($d.Count -eq 1){
                                                                                 $d.Values| Select-Object -first 1}
                                                                                 else {
                                                                                 $d 
                                                                               }} -PassThru      
}

function Button {
Param($Caption,[ScriptBlock]$Action,$property=@{})
    $baseProperties = @{
                                                             Content=$Caption
                                                            }
   $properties = Merge-HashTable $baseProperties $property  
   $btn=new-object System.Windows.Controls.Button -Property $properties 
   $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
   $btn.Add_Click($action)
   $btn
}

function DatePicker {
    Param($Name, [DateTime]$InitialValue = "", $property = @{})
    $baseProperties = @{
        Name = $name
        Text = $InitialValue                   
    }
    $properties = Merge-HashTable $baseProperties $property  
    $dpck = new-object System.Windows.Controls.DatePicker -Property $properties
    $dpck | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} 
    $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Text} -PassThru
}
function Invoke-ObjectEditor {
    [CmdletBinding()]
    Param([Parameter(ValueFromPipeline = $true)]$inputobject,
        [string[]]$Property, 
        [hashtable]$LabelMap=@{},
        [switch]$Update)

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

    $out = Dialog {$controls} -LabelMap $labelMap
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

function CredentialDialog{
  Param([PSCredential]$username) 
  $o=Dialog {Textbox UserName -InitialValue $username.UserName
          Password Password}
  if($o) {
  New-Object System.Management.Automation.PSCredential ($o.UserName, $o.Password )
  }
}