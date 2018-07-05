Import-Module WPFBot3000 -force

$typeMenuItems=@{}
function get-RelevantMenuItems{
param($item)
foreach($type in $item.PSTypeNames){
    if($typeMenuItems.ContainsKey($type)){
        $typeMenuItems[$type].Values | foreach-object {
            $menuitem=New-object System.Windows.Controls.MenuItem -property @{Header=$_.label}
            $menuitem.Tag=$_.action;
            $menuitem
        }
    }
}
}
function add-typemenuitem{
param([string]$typename,
      [string]$label,
      [Scriptblock]$action)

      if(-not $typeMenuItems.ContainsKey($typeName)){
        $typeMenuItems[$typeName]=@{}
       }
       $item=@{Label=$label;Action=$action}

       $typeMenuItems[$typeName].Add($Label,$item)
}

$files=get-childitem c:\temp -file | Select-Object -first 5

$w= window {textbox Fred 'Hello world'
                ListBox files $files
                Checkbox Blah} -Events @{Name='Fred';EventName='TextChanged';Action={
               $this.Text=$this.Text.ToUpper();$this.CaretIndex=$this.Text.Length}
               },
                                   @{Name='Files';EventName='ContextMenuOpening';Action={
    Param($sender,$e)
    $selectedItem=$lb.SelectedItem
    if($selectedItem -eq $null){
        $e.handled=$true
    } else {
        $items=get-RelevantMenuItems -item $selectedItem
        $items |foreach-object {
                 $item=$_
                 $script=[scriptblock]($item.Tag)

                $item.Add_click({
                       write-host '--------------------'
                       & $script $selectedItem | out-host
                       write-host '--------------------'
                    }.GetNewClosure())
                 $this.ContextMenu.Items.Add($item) | out-null}
    }
}},
                                   @{Name='Files';EventName='ContextMenuClosing';Action={$this.ContextMenu.Items.Clear()}}
add-typemenuitem -typename System.IO.FileInfo -label 'Show Contents' -action {Param($file) Get-Content -Path $file.FullName}
add-typemenuitem -typename System.Object -label 'Show Details' -action {$args[0] | select-object *}
add-typemenuitem -typename System.ServiceProcess.ServiceController -label 'Stop Service' -action {$args[0] | stop-service}

$c=$w.Content.Child.Children | Where-Object Name -eq 'Files'
$c.ContextMenu=new-object System.Windows.Controls.ContextMenu
#$t.Add_TextChanged({$t.Text=$t.Text.ToUpper();$t.CaretIndex=$t.Text.Length})
$w.ShowDialog()