Dialog{
    TreeView Tree 
    Button Load -Action {
        $tree=$this.Window.GetControlByName('Tree')
        Add-TreeViewItem -treeview $tree -items A,B,C
        Add-TreeViewItem -treeview $tree -parent A -items A1,A2
    }
}