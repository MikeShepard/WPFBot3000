
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER ctrl
Parameter description

.PARAMETER text
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.PARAMETER ctrl
Parameter description

.PARAMETER text
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function LabeledControl {
    [CmdletBinding()]
    Param($ctrl, $text)
    $stack = new-object System.Windows.Controls.StackPanel -Property @{
        Name        = $text
        Orientation = [System.Windows.Controls.Orientation]::Horizontal
    }
    $stack.Children.Add((Label $text)) | out-null
    $stack.Children.Add($o) | out-null
    $stack | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.Children[1].GetControlValue()} -PassThru

}