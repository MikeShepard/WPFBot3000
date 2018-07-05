<#
.SYNOPSIS
A button control

.DESCRIPTION
Outputs a WPF Button control with a caption and an action.

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
    Button "Say Hello" -Action {$t=$this.Window.GetControlByName('Name');
                                                  Write-Host "Hello, $($t.Text)"}
}).ShowDialog()


.NOTES
General notes
#>
function Button {
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
    $properties = Merge-HashTable $baseProperties $property
    $btn = new-object System.Windows.Controls.Button -Property $properties
    $btn | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $btn.Add_Click($action)
    $btn
}