# Example showing how to add an event to an object.

$w=Window {
    DataEntryGrid {TextBox Fred -property @{MinWidth=50}
    CheckBox Barney | HandlesEvent Checked {$Fred.Text=$fred.Text.ToUpper()}
} -name Data
} -ShowForValue

