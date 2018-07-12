$folders=Get-ChildItem c:\ -Directory | Where-Object {Get-ChildItem -path $_.FullName -file} | select-object -first 5

$w=Window{
    TreeView Tree
}

$tree=$w.GetControlByName('Tree')
$tree.AddTreeViewItem($null, $folders)
$folders | ForEach-Object {$tree.AddTreeViewItem($_ , (Get-ChildItem -path $_.FullName -file | select-object -first 5))}

$w.ShowDialog() |out-null