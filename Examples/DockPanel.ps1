dialog {
    DockPanel {
       Label 'Left' -property @{verticalalignment='Center';'DockPanel.Dock'='Left'}
        Label 'Right' -Property @{horizontalalignment='Right';verticalalignment='Center';'DockPanel.Dock'='Right'}
        Label 'Bottom' -Property @{horizontalalignment='Center';'DockPanel.Dock'='Bottom'}
        Label 'Top' -Property @{horizontalalignment='Center';'DockPanel.Dock'='Top'}
        MultiLineTextBox Editor -property @{MinWidth=200;MinHeight=200}
    } -property @{VerticalAlignment='Stretch';horizontalalignment='Stretch';MinHeight=200}
}