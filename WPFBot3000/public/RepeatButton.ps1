<#
.SYNOPSIS
A RepeatButton control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Primitives.RepeatButton class

.DESCRIPTION
Outputs a WPF RepeatButton control with a caption and an action.  Note, to set the delay and interval properties, include them in the -Property hashtable

.PARAMETER Caption
The text on the button

.PARAMETER Action
The action performed when the button is clicked

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The Name of the control.

.EXAMPLE
Dialog {
    TextBox Name
    RepeatButton "Say Hello" -Action {Write-Host "Hello, $($Name.Text) : $(Get-date)"}
} -Property @{Title = 'RepeatButton'}


.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.primitives.repeatbutton
#>
function RepeatButton {
    [CmdletBinding()]
    Param([String]$Caption,
        [ScriptBlock]$Action,
        [Hashtable]$Property = @{},
        [String]$Name)
    $baseProperties = @{
        Content = $Caption
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $btn = New-WPFControl -type System.Windows.Controls.Primitives.RepeatButton -Properties $baseProperties, $Property

    $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $btn.Add_Click($action)
    $btn
}