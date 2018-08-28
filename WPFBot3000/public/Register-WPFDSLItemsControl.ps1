<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a list of items

.DESCRIPTION
Creates a WPFBot3000 cmdlet for a control that can contain a list of items

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER InitialValuePropertyName
The name of the property to use to set the initial value of the control

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLItemsControl -Name Lst -Typename System.Windows.Controls.ListBox -InitialValuePropertyName SelectedItem

$file = Dialog {

  $files = Get-ChildItem C:\Windows -File | Select-Object -First 10
  Lst Files -Content $files -InitialValue $files[2]

} -Property @{ Title = 'Register-WPFDSLItemsControl'; MinHeight = 233; MinWidth = 377; }
#>

function Register-WPFDSLitemsControl{
  [CmdletBinding()]
  Param($Name, $TypeName,$InitialValuePropertyName,[switch]$HideLabel)

  $newWPFControl=Get-Command New-WPFControl
  New-Item -Path "function:global:$Name" -force -Value {
      [CmdletBinding()]
      Param($Name,[Array]$Contents, $InitialValue , $property = @{})
      $baseProperties = @{}
      if($name) {
          $baseProperties.Name=$name
      }

      $o = & $newWPFControl -Type $typename -properties $baseProperties,$property

      $o.ItemsSource=$contents
      $o.$initialValuePropertyName=$initialValue
      $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
      $o | add-member -name ValuePropertyName -MemberType NoteProperty -Value $initialValuePropertyName
      if($HideLabel){
          $o | add-member -MemberType NoteProperty -Name HideLabel -Value $True
      }
      $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {
              $this.$($this.ValuePropertyName)
              } -PassThru
  }.GetNewClosure() | out-null
}