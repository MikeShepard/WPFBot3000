function GridSplitter {
    [CmdletBinding()]
    Param([ValidateSet('Horizontal', 'Vertical')]$Orientation = 'Horizontal', $property = @{})
    if ($orientation -eq 'Horizontal') {
        $baseProperties = @{
            HorizontalAlignment = 'Stretch'
            Width               = 2
            MaxWidth=2
        }
    } else {
        $baseProperties = @{
            VerticalAlignment = 'Stretch'
            Height            = 5
            MaxHeight=5
        }
    }
    $properties = Merge-HashTable $baseProperties $property
    $splitter=new-object System.Windows.Controls.GridSplitter -Property $properties
    $splitter | add-member -Name Window -MemberType ScriptProperty -Value {[System.Windows.Window]::GetWindow($this)} -PassThru

}