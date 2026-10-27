# ToolBar

Creates a WPF `ToolBar` containing items produced by a scriptblock.

```powershell
ToolBar -Name Actions {
    Button Refresh -Name RefreshButton -Action { Write-Host 'Refresh' }
    TextBox Search -InitialValue 'example'
} -Property @{ Band = 1 }
```

- `Contents`: scriptblock that outputs toolbar items.
- `Name`: optional control name.
- `Property`: hashtable of WPF properties, including attached properties.

Named items with `GetControlValue()` contribute to the toolbar's `GetControlValue()` result. The toolbar also supports `GetControlByName()` for its items.

See [Microsoft's ToolBar reference](https://learn.microsoft.com/en-us/dotnet/api/system.windows.controls.toolbar).
