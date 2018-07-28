# Example showing TabControls and TabItems

$output=dialog {
    TabControl -name Top {
        TabItem Fred  {
            DataEntryGrid -name Tab1 {
                TextBox ABC -property @{MinWidth=50}
                TextBox DEF -property @{MinWidth=50}
            }
        }
        TabItem Barney {
            listbox -contents (dir c:\temp | select -first 10) -name Barney2
        }
        TabItem Wilma {
            listbox -contents (dir c:\temp | select -first 10) -name Wilma2
        }
        TabItem Betty {
            listbox -contents (dir c:\temp | select -first 10) -name Betty2
        }
    }
}