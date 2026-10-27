function Set-WPFNavigationContent {
    param($Control, [scriptblock]$Contents)

    if ($Contents) {
        $items = @(& $Contents)
        if ($items.Count -eq 1) {
            $Control.Content = $items[0]
        }
        elseif ($items.Count -gt 1) {
            $Control.Content = StackPanel { $items } -Orientation Vertical
        }
    }
}
