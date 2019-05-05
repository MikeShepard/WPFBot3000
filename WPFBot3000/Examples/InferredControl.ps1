Import-module WPFBot3000 -force
Dialog {Firstname  #this will be a textbox (command not found, no pattern in name)
        'Last Name'  #this will be a textbox (string in output)
        BirthDate #this will be a date picker (command not found, pattern in name)
        @{Domain='dev.local','qa.local'}   #this will be a combobox (hashtable, uses first key only)
} -verbose 