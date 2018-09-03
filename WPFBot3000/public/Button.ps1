<#
.SYNOPSIS
A Button control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Button class

.DESCRIPTION
Outputs a WPF Button control with a caption and an action.

.PARAMETER Caption
The text on the button

.PARAMETER Action
The action performed when the button is clicked

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.PARAMETER Name
The Name of the control.

.EXAMPLE
Window {
    TextBox Name
    Button "Say Hello" -Action {Write-Host "Hello, $($Name.Text)"}
} -Property @{ Title = 'Button'; MinHeight = 233; MinWidth = 377; } -ShowForValue

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.button
#>
function Button {
    [CmdletBinding()]
    Param([string]$Caption,
        [ScriptBlock]$Action,
        [hashtable]$Property = @{},
        [string]$Name)
    $baseProperties = @{
        Content = $Caption
    }
    if ($Name) {
        $baseProperties.Name = $Name
    }
    $btn = New-WPFControl -type System.Windows.Controls.Button -Properties $baseProperties, $Property

    $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $btn.Add_Click($action)
    $btn
}