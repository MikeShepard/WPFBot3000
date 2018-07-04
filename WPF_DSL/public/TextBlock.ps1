<#
.SYNOPSIS
A textblock control

.DESCRIPTION
A textblock control (i.e. a static block of text, not to be confused with a textbox)

.PARAMETER Text
The text to be loaded into the textblock

.PARAMETER name
the name of the control

.PARAMETER property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$text=get-content c:\windows\system32\drivers\etc\hosts | select -first 20

Dialog {
    TextBlock ([string]::Join("`r`n",$text))
}


.NOTES
General notes
#>
function TextBlock {
    [CmdletBinding()]
    Param([string]$Text,
          [string]$name,
          [hashtable]$property = @{})

    $BaseProperties=@{
        Text = $text
    }

    $properties = Merge-HashTable $baseProperties $property

    $textblock = new-object System.Windows.Controls.TextBlock -Property $properties
    if ($name) {
        $textblock.Name = $name
    }
    $textblock | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $textblock | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}