function Border {
    [CmdletBinding()]
    Param([Scriptblock]$Contents,
          [hashtable]$Property = @{},
          [string]$name)
    $baseProperties = @{
    }
    if ($name) {
        $baseProperties.Name = $name
    }
    $border=New-WPFControl -type System.Windows.Controls.Border -Properties $baseProperties,$property

    $c = & $Contents
    if($c -is [System.Windows.UIElement]){
        $border.Child=$c
    } else {
        $border.Child =StackPanel {$c}
    }
    $border | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)}
    $border | add-member -MemberType ScriptMethod -Name GetControlByName -Value $function:GetControlByName
    $border | add-member -Name GetControlValue -MemberType ScriptMethod -Value {$d = @{}
        $this.Child | ForEach-Object {if ($_| get-member GetControlValue) {
                $d.Add($this.Name, $_.GetControlValue())
            }}
        if ($d.Count -eq 1) {
            $d.Values| Select-Object -first 1
        }
        else {
            [pscustomobject]$d
        }}
        $border  | add-member -MemberType NoteProperty -Name HideLabel -Value $True -PassThru
}
