function Set-WindowOutput {
    [CmdletBinding()]
    Param($Window,
          $outputValue,
          [switch]$close        )
    if(-not ($window | Get-Member -Name OverrideOutput -MemberType NoteProperty)){
        $window | Add-Member  -Name OverrideOutput -MemberType NoteProperty -value $outputValue
    } else {
       $window.OverrideOutput=$outputValue
    }
    if($close){
        $window.DialogResult = $true
    }
}