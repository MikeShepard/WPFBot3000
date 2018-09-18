<#
.SYNOPSIS
A ListBox control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.ListBox class

.DESCRIPTION
A ListBox control

.PARAMETER Name
The name of the control

.PARAMETER Contents
The contents of the ListBox

.PARAMETER InitialValue
The item from $contents that is initally selected

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER MultiSelect
Sets the selectionMode of the ListBox to "Extended"

.EXAMPLE
$files=get-childitem c:\windows -file | select-object -first 10
Dialog {
    Listbox Files -contents $files
} -Title ListBox

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.listbox
#>
function ListBox {
    [CmdletBinding()]
    Param([string]$Name,
        [Array]$Contents = @(),
        $InitialValue,
        [Hashtable]$Property = @{},
        [switch]$MultiSelect)
    $baseProperties = @{
        Name = $Name
    }
    $l = New-WPFControl -type System.Windows.Controls.ListBox -Properties $baseProperties, $Property
    if ($MultiSelect) {
        $l.SelectionMode = 'Extended'
    }
    if ($Contents) {
        $Contents | ForEach-Object {
            $lvi = new-object System.Windows.Controls.ListBoxItem
            $lvi.Tag = $_
            $lvi.Content = $_.ToString()
            $l.Items.Add($lvi) | out-null
            if ($InitialValue -and $_ -eq $InitialValue) {
                $l.SelectedItem = $lvi
            }
        }
    }
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$items = $this.SelectedItems
        foreach ($item in $items) {
            if ($item -is [System.Windows.Controls.Listboxitem] -and $item.Tag) {
                $item.Tag
            }
            else {
                $item
            }
        }
    } -PassThru
}
