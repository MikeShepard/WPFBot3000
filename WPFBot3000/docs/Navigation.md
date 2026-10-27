# Navigation and browser controls

`Page`, `Frame`, and `NavigationWindow` wrap the corresponding WPF navigation types.
Their `-Contents` scriptblock supplies initial content; multiple controls are placed in a vertical `StackPanel`.
Use `-Name` for a named control and `-Property` for WPF properties.

```powershell
$window = NavigationWindow -Name Main -Property @{ Title = 'People' } {
    Page -Name Details {
        TextBox FirstName -InitialValue 'Fred'
        TextBox LastName -InitialValue 'Flintstone'
    }
}
$window.Show()
```

A `Frame` can be placed inside another window and navigated to a page:

```powershell
$frame = Frame -Name ContentFrame { Page { TextBlock 'First page' } }
$window = Window { $frame }
$window.Show()
$frame.Navigate((Page { TextBlock 'Second page' }))
```

To navigate to a XAML URI instead, set `Source` through `-Property` and omit `-Contents`.
WPF navigation is asynchronous: wait for `Navigated` or `LoadCompleted` before reading the current content or attaching handlers to its children.
`GetControlByName()` searches the current content, and `GetControlValue()` returns the current page's value when available.
For `NavigationWindow`, use `GetWindowOutput()` instead.
URI-loaded content is not automatically wrapped with WPFBot3000 value or lookup methods.

## Hyperlinks

`Hyperlink` is an inline element, not a control that can be added directly to a panel.
Use `TextBlock -Contents` to combine strings and hyperlinks:

```powershell
TextBlock -Name Message -Contents {
    'More information: '
    Hyperlink -Name DetailsLink -Text 'Details' -NavigateUri 'https://example.com'
}
```

A navigation host handles `NavigateUri` according to WPF navigation rules.
For links outside a navigation host or for custom behavior, attach a `Click` or `RequestNavigate` handler with `HandlesEvent`.
The module does not automatically launch an external browser.

## Embedded browser

`WebBrowser` creates a WPF browser control without navigating by default.
Set `Source` in `-Property` or call `Navigate()` or `NavigateToString()` on the returned control.
Attach events with `HandlesEvent`.
Dispose the browser when it is no longer needed.

```powershell
$browser = WebBrowser -Name Browser -Property @{ Width = 600; Height = 400 }
$browser.NavigateToString('<html><body>Local content</body></html>')
```

WPF `WebBrowser` uses the legacy Internet Explorer engine, not Edge WebView2.
Its rendering and security behavior depend on Windows configuration; do not assume modern browser compatibility.
