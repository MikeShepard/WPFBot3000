function Dialog {
    [CmdletBinding()]
    param([scriptblock]$Contents,
        [hashtable]$labelMap = @{},
        [hashtable[]]$Events,
        [string]$title)
    $c = & $contents
    $PSBoundParameters.Remove('Contents')| out-null
    $w = Window {
        $c
        StackPanel {Button OK {  $this.Window.DialogResult = $true } -property @{}
                    Button Cancel { $this.Window.DialogResult = $false} -property @{}
        } -Orientation Horizontal -Property @{}
    } @PSBoundParameters
    $w.Content.RowDefinitions[-1].Height='Auto'
    $dialogResult = $w.Showdialog()
    if ($dialogResult) {
        $w.GetWindowOutput()
    }
}
