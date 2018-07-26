Describe "Window functionality" -tag Local {
    It "Returns an object for a textbox" {
        $w=Window { TextBox Name -initialValue Fred}
        $w.GetWindowOutput().Name | should be Fred
    }
    #It "Returns a complex object for nested controls" {
    #    $w=Window {Grid  {TextBox Name -InitialValue Fred} -name SP}
    #    $w.GetWindowOutput().SP.Name | Should Be Fred
    #}
}