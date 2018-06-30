Import-Module wpf_dsl -force
$output=dialog {
    TabControl -name Top {
        TabItem Fred  {
            listbox -contents (dir c:\temp | select -first 10)
        }
        TabItem Barney {
            listbox -contents (dir c:\temp | select -first 10)
        }
        TabItem Wilma {
            listbox -contents (dir c:\temp | select -first 10)
        }
        TabItem Betty {
            listbox -contents (dir c:\temp | select -first 10)
        }
    } 
} 