Dialog{
    TreeView Tree
    Button Load -Action {
        $tree=$this.Window.GetControlByName('Tree')
        $tree.AddTreeViewItem($null,@( 'A','B','C' ))
        $tree.AddTreeViewItem('A',@('A1','A2'))
    }
}