Describe 'Navigation controls' {
    BeforeAll {
        Import-Module (Join-Path (Split-Path $PSScriptRoot -Parent) 'WPFBot3000/WPFBot3000.psd1') -Force

        function script:CompleteNavigation {
            param([scriptblock]$Condition)

            $dispatcherFrame = New-Object System.Windows.Threading.DispatcherFrame
            $timer = New-Object System.Windows.Threading.DispatcherTimer
            $deadline = [DateTime]::UtcNow.AddSeconds(5)
            $timer.Interval = [TimeSpan]::FromMilliseconds(20)
            $timer.Add_Tick({
                if ((& $Condition) -or [DateTime]::UtcNow -ge $deadline) {
                    $timer.Stop()
                    $dispatcherFrame.Continue = $false
                }
            }.GetNewClosure())
            $timer.Start()
            [System.Windows.Threading.Dispatcher]::PushFrame($dispatcherFrame)
            if (-not (& $Condition)) { throw 'Navigation did not complete within five seconds.' }
        }
    }

    It 'creates a page with multiple controls and returns their values' {
        $page = Page -Name Details -Property @{ Title = 'Details' } {
            TextBox First -InitialValue 'Fred'
            TextBox Last -InitialValue 'Flintstone'
        }

        ($page -is [System.Windows.Controls.Page]) | Should Be $true
        $page.Title | Should Be 'Details'
        $page.GetControlValue().First | Should Be 'Fred'
        $page.GetControlByName('Last').Text | Should Be 'Flintstone'
    }

    It 'navigates a frame to a page and exposes its contents' {
        $frame = Frame -Name ContentFrame {
            Page -Name Details { TextBox First -InitialValue 'Fred' }
        }
        CompleteNavigation { $null -ne $frame.Content }

        ($frame -is [System.Windows.Controls.Frame]) | Should Be $true
        $frame.Content.Name | Should Be 'Details'
        $frame.GetControlValue() | Should Be 'Fred'
        $frame.GetControlByName('First').Text | Should Be 'Fred'
    }

    It 'returns the current page value after navigating to another page' {
        $frame = Frame { Page { TextBox First -InitialValue 'Fred' } }
        CompleteNavigation { $null -ne $frame.Content }
        $nextPage = Page { TextBox First -InitialValue 'Barney' }
        $frame.Navigate($nextPage) | Out-Null
        CompleteNavigation { $frame.Content -eq $nextPage }

        $frame.GetControlValue() | Should Be 'Barney'
        $frame.GetControlByName('First').Text | Should Be 'Barney'
    }

    It 'navigates a frame to a local XAML source' {
        $path = Join-Path $TestDrive 'page.xaml'
        Set-Content -Path $path -Encoding UTF8 -Value '<Page xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Title="From file"><TextBlock>Local page</TextBlock></Page>'
        $frame = Frame -Property @{ Source = [uri]$path }
        CompleteNavigation { $null -ne $frame.Content }

        $frame.Content.Title | Should Be 'From file'
        $frame.Content.Content.Text | Should Be 'Local page'
    }

    It 'navigates a navigation window to a page' {
        $window = NavigationWindow -Name Main -Property @{ Title = 'Navigator' } {
            Page { TextBox First -InitialValue 'Fred' }
        }
        CompleteNavigation { $null -ne $window.Content }

        ($window -is [System.Windows.Navigation.NavigationWindow]) | Should Be $true
        $window.Title | Should Be 'Navigator'
        $window.GetWindowOutput() | Should Be 'Fred'
        $window.GetControlByName('First').Text | Should Be 'Fred'
        $window.Close()
    }

    It 'navigates a navigation window to a local XAML source' {
        $path = Join-Path $TestDrive 'window-page.xaml'
        Set-Content -Path $path -Encoding UTF8 -Value '<Page xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Title="From file"><TextBlock>Local page</TextBlock></Page>'
        $window = NavigationWindow -Property @{ Source = [uri]$path }
        CompleteNavigation { $null -ne $window.Content }

        $window.Content.Title | Should Be 'From file'
        $window.Content.Content.Text | Should Be 'Local page'
        $window.Close()
    }

    It 'composes named hyperlinks as inline content and exposes events' {
        $text = TextBlock -Name Message -Contents {
            'Open '
            Hyperlink -Name Link -Text 'details' -NavigateUri 'https://example.com' |
                HandlesEvent Click { param($sender, $eventArgs) $sender.Tag = 'clicked' }
        }
        $link = $text.GetControlByName('Link')
        $link.RaiseEvent((New-Object System.Windows.RoutedEventArgs ([System.Windows.Documents.Hyperlink]::ClickEvent)))

        $text.Inlines.Count | Should Be 2
        $link.Inlines.FirstInline.Text | Should Be 'details'
        $link.NavigateUri.AbsoluteUri | Should Be 'https://example.com/'
        $link.Tag | Should Be 'clicked'
    }

    It 'finds an inline hyperlink through a window and binds its event' {
        $window = Window {
            StackPanel {
                TextBlock -Contents { Hyperlink -Name Link -Text 'details' }
            }
        } -Events @{ Name = 'Link'; EventName = 'Click'; Action = { param($sender, $eventArgs) $sender.Tag = 'clicked' } }
        $link = $window.GetControlByName('Link')
        $link.RaiseEvent((New-Object System.Windows.RoutedEventArgs ([System.Windows.Documents.Hyperlink]::ClickEvent)))

        $link.Tag | Should Be 'clicked'
        $window.Close()
    }

    It 'preserves existing text block text usage' {
        $text = TextBlock 'Existing text' -Name Message

        $text.Text | Should Be 'Existing text'
    }

    It 'constructs an empty browser with configurable properties and events' {
        $browser = WebBrowser -Name Browser -Property @{ Width = 400 } |
            HandlesEvent Navigating { param($sender, $eventArgs) }

        ($browser -is [System.Windows.Controls.WebBrowser]) | Should Be $true
        $browser.Name | Should Be 'Browser'
        $browser.Width | Should Be 400
        $browser.Source | Should BeNullOrEmpty
        $browser.Dispose()
    }

    It 'loads local HTML in the embedded browser' {
        $browser = WebBrowser -Name Browser
        try {
            $browser.NavigateToString('<html><body>sample</body></html>')
            CompleteNavigation { $null -ne $browser.Document -and $null -ne $browser.Document.body }

            $browser.Document.body.innerText | Should Be 'sample'
        }
        finally {
            $browser.Dispose()
        }
    }

    It 'loads a local file through the browser Source property' {
        $path = Join-Path $TestDrive 'browser.html'
        Set-Content -Path $path -Encoding UTF8 -Value '<html><body>local file</body></html>'
        $browser = WebBrowser -Property @{ Source = [uri]$path }
        try {
            CompleteNavigation { $null -ne $browser.Document -and $null -ne $browser.Document.body }

            $browser.Document.body.innerText.Trim() | Should Be 'local file'
        }
        finally {
            $browser.Dispose()
        }
    }

    It 'rejects conflicting frame content and source' {
        { Frame -Property @{ Source = 'file:///example.xaml' } { Page } } | Should Throw
    }

    It 'rejects conflicting navigation window content and source' {
        { NavigationWindow -Property @{ Source = 'file:///example.xaml' } { Page } } | Should Throw
    }

    It 'supports empty containers' {
        $page = Page
        $frame = Frame
        $window = NavigationWindow

        $page.Content | Should BeNullOrEmpty
        $frame.Content | Should BeNullOrEmpty
        $window.Content | Should BeNullOrEmpty
        $window.Close()
    }
}
