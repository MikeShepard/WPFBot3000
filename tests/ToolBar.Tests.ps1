Describe 'ToolBar and ToolBarTray' {
    BeforeAll {
        Import-Module (Join-Path (Split-Path $PSScriptRoot -Parent) 'WPFBot3000/WPFBot3000.psd1') -Force
    }

    It 'creates a toolbar with items, properties, and nested values' {
        $bar = ToolBar -Name Actions -Property @{ Band = 1 } -Contents {
            TextBox Query -InitialValue 'example'
            Button Search
        }

        ($bar -is [System.Windows.Controls.ToolBar]) | Should Be $true
        $bar.Name | Should Be 'Actions'
        $bar.Band | Should Be 1
        $bar.Items.Count | Should Be 2
        $bar.GetControlValue().Query | Should Be 'example'
        $bar.HideLabel | Should Be $true
    }

    It 'creates an empty toolbar and tray' {
        $bar = ToolBar
        $tray = ToolBarTray

        $bar.Items.Count | Should Be 0
        $tray.ToolBars.Count | Should Be 0
    }

    It 'places multiple toolbars in a tray and returns their values' {
        $tray = ToolBarTray -Name Tools -Property @{ IsLocked = $true } -Contents {
            ToolBar -Name First { TextBox Query -InitialValue 'example' }
            ToolBar -Name Second { CheckBox Active -InitialValue $true }
        }

        ($tray -is [System.Windows.Controls.ToolBarTray]) | Should Be $true
        $tray.Name | Should Be 'Tools'
        $tray.IsLocked | Should Be $true
        $tray.ToolBars.Count | Should Be 2
        $tray.GetControlValue().First.Query | Should Be 'example'
        $tray.GetControlValue().Second.Active | Should Be $true
        $tray.HideLabel | Should Be $true
    }

    It 'finds toolbar items and attaches window events' {
        $window = Window {
            DockPanel {
                ToolBarTray -Name Tools {
                    ToolBar -Name Actions { Button Search -Name SearchButton }
                }
            }
        } -Events @{ Name = 'SearchButton'; EventName = 'Click'; Action = { param($sender, $eventArgs) $sender.Tag = 'clicked' } }

        $button = $window.GetControlByName('SearchButton')
        $button.RaiseEvent([System.Windows.RoutedEventArgs]::new([System.Windows.Controls.Button]::ClickEvent))

        $button.Tag | Should Be 'clicked'
    }

    It 'returns nested values through the window' {
        $window = Window {
            DockPanel -Name Layout {
                ToolBarTray -Name Tools {
                    ToolBar -Name Actions { TextBox Query -InitialValue 'example' }
                }
            }
        }

        $window.GetWindowOutput().Tools.Actions.Query | Should Be 'example'
    }

    It 'skips unnamed and non-control toolbar items when looking up a name' {
        $bar = ToolBar { 'plain item'; Button Search -Name SearchButton }

        $bar.GetControlByName('SearchButton').Content | Should Be 'Search'
        $bar.GetControlByName('Missing') | Should BeNullOrEmpty
    }

    It 'preserves lookup through existing panel children' {
        $panel = DockPanel { StackPanel -Name Nested { Button Search -Name SearchButton } }

        $panel.GetControlByName('Nested').Name | Should Be 'Nested'
        $panel.GetControlByName('SearchButton').Content | Should Be 'Search'
    }

    It 'rejects content that is not a toolbar' {
        { ToolBarTray { Button Search } -ErrorAction Stop } | Should Throw
    }
}
