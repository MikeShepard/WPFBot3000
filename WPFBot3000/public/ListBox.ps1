<#
.SYNOPSIS
A listbox control

.DESCRIPTION
A listbox control

.PARAMETER name
The name of the control

.PARAMETER contents
The contents of the listbox

.PARAMETER initialValue
The item from $contents that is initally selected

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$files=get-childitem c:\windows -file | select-object -first 10
Dialog {
    Listbox Files -contents $files
}

.NOTES
General notes
#>
function ListBox {
    [CmdletBinding()]
    Param([string]$name,
          [Array]$contents = @(),
          $initialValue,
          [Hashtable]$property = @{})
    $baseProperties = @{
        Name = $name
    }
    $l=New-WPFControl -type System.Windows.Controls.ListBox -Properties $baseProperties,$property

    if ($Contents) {
        $contents | ForEach-Object {
            $lvi = new-object System.Windows.Controls.ListBoxItem
            $lvi.Tag = $_
            $lvi.Content = $_.ToString()
            $l.Items.Add($lvi) | out-null
            if ($initialValue -and $_ -eq $initialValue) {
                $l.SelectedItem = $lvi
            }
        }
    }
    $l | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $l | add-member -MemberType ScriptMethod -Name GetControlValue -Value {$item=$this.SelectedItem
                                                                           if($item -is [listboxitem] -and $item.Tag){
                                                                               $item.Tag
                                                                           } else {
                                                                               $item
                                                                           }} -PassThru
}
