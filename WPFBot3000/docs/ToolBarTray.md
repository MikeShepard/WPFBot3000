# ToolBarTray

Creates a WPF `ToolBarTray` containing toolbars produced by a scriptblock.

```powershell
Window {
    DockPanel {
        ToolBarTray -Name Tools {
            ToolBar -Name Actions {
                Button Refresh -Name RefreshButton -Action { Write-Host 'Refresh' }
            }
        } -Property @{ IsLocked = $true; 'DockPanel.Dock' = 'Top' }
        TextBlock -Text 'Content'
    }
}
```

- `Contents`: scriptblock that outputs `ToolBar` controls.
- `Name`: optional control name.
- `Property`: hashtable of WPF properties, including attached properties.

Named toolbars with `GetControlValue()` contribute to the tray's `GetControlValue()` result. The tray also supports `GetControlByName()` for nested toolbars and items.

See [Microsoft's ToolBarTray reference](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.toolbartray).
