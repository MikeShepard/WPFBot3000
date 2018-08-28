<#
.SYNOPSIS
A TextBlock control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.TextBlock class

.DESCRIPTION
A TextBlock control (i.e. a static block of text, not to be confused with a textbox)

.PARAMETER Text
The text to be loaded into the TextBlock

.PARAMETER Name
The name of the control

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
$text = get-content c:\windows\system32\drivers\etc\hosts | select -first 20

Dialog {

  TextBlock ([string]::Join("`r`n",$text))

} -Property @{ Title = 'TextBlock'; MinHeight = 377; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.textblock
#>
function TextBlock {
  [CmdletBinding()]
  Param([string]$Text,
    [string]$Name,
    [hashtable]$Property = @{})

  $BaseProperties = @{
    Text = $text
  }

  if ($name) {
    $BaseProperties.Name = $name
  }
  $textblock = New-WPFControl -type System.Windows.Controls.TextBlock -Properties $baseProperties, $property

  $textblock | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $textblock | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}