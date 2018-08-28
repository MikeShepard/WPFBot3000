# WPFBot3000

![Build status](https://ci.appveyor.com/api/projects/status/ah7ogmp5uj4gufa8?svg=true)

### A Domain-Specific Language for PowerShell that encapsulates and simplifies Windows Presentation Foundation (WPF) classes


## Installation

### PowerShell version check (minimum)
```
PS \> $PSVersionTable.PSVersion

Major  Minor  Build  Revision
-----  -----  -----  --------
5      1      (any)  (any)
```

### Install From PowerShell (Admin)
```
PS \> Install-Module -Name WPFBot3000 -Force
```

### [Visit WPFBot3000 at the PowerShell Gallery][installation]


## Quickstart

### Example One
```powershell
Import-Module WPFBot3000;

Dialog {
  TextBox FirstName
  TextBox LastName
  TextBox EmailAddress
  DatePicker ReminderDate
}
```

### Example Two: 'Hello, World'
```powershell
Import-Module WPFBot3000;

Dialog {
  TextBox Name -property @{ Padding = '0,4,0,0' }
  Button Personalize -Action { $Greeting.Content="Hello, $($Name.Text)!" }
  Label 'Hello, World!' -Name Greeting
} -Property @{ Title = 'Hello!'; MinHeight = 144; MinWidth = 233; }
```


## Documentation

### Frequently Used Controls
  - [Border](WPFBot3000/docs/Border.md)
  - [Button](WPFBot3000/docs/Button.md)
  - [Calendar](WPFBot3000/docs/Calendar.md)
  - [CheckBox](WPFBot3000/docs/CheckBox.md)
  - [ComboBox](WPFBot3000/docs/ComboBox.md)
  - [DockPanel](WPFBot3000/docs/DockPanel.md)
  - [GroupBox](WPFBot3000/docs/GroupBox.md)
  - [Label](WPFBot3000/docs/Label.md)
  - [MenuItem](WPFBot3000/docs/MenuItem.md)
  - [RadioButton](WPFBot3000/docs/RadioButton.md)
  - [Separator](WPFBot3000/docs/RadioButton.md)
  - [TextBox](WPFBot3000/docs/TextBox.md)

### [Microsoft .NET WPF System.Windows.Controls Reference][microsoft-wpf-reference]


## Blog

### [Visit Mike's blog: PowerShell Station][blog]

[installation]: https://www.powershellgallery.com/packages/WPFBot3000
[microsoft-wpf-reference]: https://msdn.microsoft.com/en-us/library/system.windows.controls
[blog]: https://powershellstation.com/