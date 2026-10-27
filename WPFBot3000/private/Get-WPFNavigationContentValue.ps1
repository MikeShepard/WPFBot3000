function Get-WPFNavigationContentValue {
    if ($null -ne $this.Content -and (Get-Member -InputObject $this.Content -Name GetControlValue)) {
        $this.Content.GetControlValue()
    }
}
