<#
.SYNOPSIS
A TextBlock control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TextBlock class

.DESCRIPTION
A TextBlock control (i.e. a static block of text, not to be confused with a TextBox)

.PARAMETER Text
The text to be loaded into the TextBlock

.PARAMETER Contents
A scriptblock that outputs strings and inline elements such as Hyperlink.

.PARAMETER Name
the name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$text = get-content c:\windows\system32\drivers\etc\hosts | select -first 20

Dialog {
    TextBlock ([string]::Join("`r`n",$text))
}

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.textblock
#>
function TextBlock {
    [CmdletBinding()]
    Param([string]$Text,
        [string]$Name,
        [hashtable]$Property = @{},
        [scriptblock]$Contents)

    $BaseProperties = @{
        Text = $text
    }

    if ($Name) {
        $BaseProperties.Name = $Name
    }
    $textblock = New-WPFControl -type System.Windows.Controls.TextBlock -Properties $baseProperties, $Property
    if ($Contents) {
        foreach ($inline in (& $Contents)) {
            $textblock.Inlines.Add($inline)
        }
    }
    $textblock | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $textblock | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}