Describe "Window functionality" -tag Local {
    It "Returns an object for a textbox" {
        $w=Window { TextBox Name -initialValue Fred}
        $w.GetWindowOutput().Name | should be Fred
    }
    It "Returns a complex object for Grid (with single child)" {
        $w=Window {Grid  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for StackPanel (with single child)" {
        $w=Window {StackPanel  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for DockPanel (with single child)" {
        $w=Window {DockPanel  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for Expander (with single child)" {
        $w=Window {Expander  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for GroupBox (with single child)" {
        $w=Window {GroupBox  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for ScrollViewer (with single child)" {
        $w=Window {ScrollViewer  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for ViewBox (with single child)" {
        $w=Window {ViewBox  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a complex object for WrapPanel (with single child)" {
        $w=Window {WrapPanel  {TextBox Name -InitialValue Fred} -name SP}
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
    It "Returns a simple object (with a menu)" {
        $w=Window {
            Menu Menus {
                MenuItem TopLevel -contents{
                    MenuItem Increment -action { $value.Text=1+$Value.Text}
                    MenuItem Decrement -action { $value.Text=-1+$Value.Text}
                }
            }
            TextBox Name -InitialValue Fred
        }
        $w.GetWindowOutput().Name | Should Be Fred
    }
    It "Returns a complex object (with a menu)" {
        $w=Window {
            StackPanel{
            Menu Menus {
                MenuItem TopLevel -contents{
                    MenuItem Increment -action { $value.Text=1+$Value.Text}
                    MenuItem Decrement -action { $value.Text=-1+$Value.Text}
                }
            }
            TextBox Name -InitialValue Fred
        } -name SP
        }
        $w.GetWindowOutput().SP.Name | Should Be Fred
    }
}