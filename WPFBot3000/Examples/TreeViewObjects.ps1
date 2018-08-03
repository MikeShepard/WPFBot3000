$folders=Get-ChildItem c:\ -Directory | Where-Object {Get-ChildItem -path $_.FullName -file} | select-object -first 5

$w=Window{
    DataEntryGrid -contents {
    TreeView Tree
    Button OK {$this.Window.DialogResult=$true}
    }
}

$tree.AddTreeViewItem($null, $folders)
$folders | ForEach-Object {$tree.AddTreeViewItem($_ , (Get-ChildItem -path $_.FullName -file | select-object -first 5))}

$w.ShowForValue()