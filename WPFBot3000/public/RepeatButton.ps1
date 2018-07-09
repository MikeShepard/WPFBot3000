<#
.SYNOPSIS
A Repeat button control

.DESCRIPTION
Outputs a WPF RepeatButton control with a caption and an action.  Note, to set the delay and interval properties, include them in the -Property hashtable.

.PARAMETER Caption
The text on the button

.PARAMETER Action
The action performed when the button is clicked

.PARAMETER property
Properties to extend/override the base properties defined in the function

.PARAMETER name
The Name of the control.

.EXAMPLE
(Window {
    TextBox Name
    RepeatButton "Say Hello" -Action {$t=$this.Window.GetControlByName('Name');
                                                  Write-Host "Hello, $($t.Text) : $(Get-date)"}
}).ShowDialog()


.NOTES
General notes
#>
function RepeatButton {
    [CmdletBinding()]
    Param([string]$Caption,
          [ScriptBlock]$Action,
          [hashtable]$property = @{},
          [string]$name)
    $baseProperties = @{
        Content = $Caption
    }
    if($name){
      $baseProperties.Name=$name
    }
    $btn=New-WPFControl -type System.Windows.Controls.Primitives.RepeatButton -Properties $baseProperties,$property

    $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $btn.Add_Click($action)
    $btn
}