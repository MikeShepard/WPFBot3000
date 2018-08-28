<#
.SYNOPSIS
Creates a WPFBot3000 cmdlet for a control that can contain a single control

.DESCRIPTION
Creates a WPFBot3000 cmdletfor a control that can contain a single control

.PARAMETER Name
The name of the cmdlet to be created

.PARAMETER TypeName
The type name of the control to be "wrapped"

.PARAMETER HideLabel
Whether the control shows a label or not

.EXAMPLE
Register-WPFDSLContentControl -Name Brd -Typename System.Windows.Controls.Border -HideLabel

Dialog {
    
  Brd Flintstones {

    TextBox Fred -Property @{ Width = ($Flintstones.MinWidth * .5) }
    TextBox Barney -Property @{ Width = ($Flintstones.MinWidth * .5) }
    
  } -Property @{ BorderBrush = 'Red'; BorderThickness = 3; MinWidth = 377; }

} -Property @{ Title = 'Register-WPFDSLContentControl'; MinHeight = 233; MinWidth = 377; }
#>
function Register-WPFDSLContentControl {
  [CmdletBinding()]
  Param($Name, $TypeName, [switch]$HideLabel)

  $newWPFControl=Get-Command New-WPFControl
  $getControlMethod=Get-Command GetControlByName | Select-Object -expandProperty ScriptBlock
  New-Item -Path "function:global:$Name" -force -Value {
      [CmdletBinding()]
      Param($Name, [ScriptBlock]$Contents , $property = @{})
      $baseProperties = @{
      }
      if ($name) {
          $baseProperties.Name = $name
      }
      $o = & $newWPFControl -type $TypeName -Properties $baseProperties, $property

      [System.Windows.UIElement[]]$c = & $Contents
      $c = & $Contents
      if ($c -is [System.Windows.UIElement]) {
          $o.Child = $c
      } else {
          $o.Child = StackPanel {$c}
      }
      $o | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
      $o | add-member -MemberType ScriptMethod -Name GetControlByName -Value $getControlMethod
      $o | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
          $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                  $d.Add($_.Name, $_.GetControlValue())
              }}
          if ($d.Count -eq 1) {
              $d.Values| Select-Object -first 1
          } else {
              [pscustomobject]$d
          }}
      if ($HideLabel) {
          $o | add-member -MemberType NoteProperty -Name HideLabel -Value $True
      }
      $o
  }.GetNewClosure() | out-null
}