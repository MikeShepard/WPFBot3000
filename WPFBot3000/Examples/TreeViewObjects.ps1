$folders=Get-ChildItem c:\ -Directory | Where-Object {Get-ChildItem -path $_.FullName -file} | select-object -first 5

$w=Window{
    TreeView Tree 
}

$tree=$w.GetControlByName('Tree')
Add-TreeViewItem -treeview $tree -items $folders
$folders | ForEach-Object {Add-TreeViewItem -treeview $tree -parent $_ -items (Get-ChildItem -path $_.FullName -file | select-object -first 5)}

$w.ShowDialog() |out-null