<#
.SYNOPSIS
A Calendar control that encapsulates the Windows Presentation Foundation (WPF) System.Windows.Controls.Calendar class

.DESCRIPTION
A calendar control

.PARAMETER Name
The name of the control

.PARAMETER InitialValue
The date to set the control to

.PARAMETER Property
Properties to extend/override the base properties defined in the function

.EXAMPLE
Dialog {

  TextBox EmailAddress
  Calendar BirthDate

} -Property @{ Title = 'Calendar'; MinHeight = 233; MinWidth = 377; }

.LINK
https://msdn.microsoft.com/en-us/library/system.windows.controls.calendar
#>
function Calendar {
  [CmdletBinding()]
  Param([string]$Name,
    [DateTime]$InitialValue = (get-date),
    [HashTable]$Property = @{})
  $baseProperties = @{
    Name         = $name
    SelectedDate = $InitialValue
  }
  $dpck = New-WPFControl -type System.Windows.Controls.Calendar -Properties $baseProperties, $property

  $dpck | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
  $dpck | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$this.SelectedDate} -PassThru
}