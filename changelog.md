# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.9.24]

- Added Canvas panel
- Updated CI so it runs the actual Window pester tests on AppVeyor

## [0.9.23]

- Removed unnecessary aliases for window and dialog, renaming Invoke-WPFBotDialog and New-WPFBotWindow back

## [0.9.22]

- Fixed problem with Window outputting Object[] Array when it contained multiple objects

## [0.9.21]

- Allowed window to contain multiple objects (but broken, fixed in 0.9.22)

## [0.9.20]

- Switched back to PSDeploy deployment

## [0.9.19]

- Added HandlesEvent function to allow for easier event handlers

## [0.9.18]

- Added missing GetControlByName method to Dockpanel

## [0.9.17]

- Added Dockpanel back to Window after DataEntryGrid refactor
- Added -force to Dialog Alias

## [0.9.16]

- Refactored DataEntryGrid out of Window
- Reviewed all examples
- Removed Using statement to eliminate PowerShell 5 requirement

## [0.9.15]

- Added Dockpanel inside Window (for docking of Menu)

## [0.9.14]

- Change window and dialog to aliases of Verb-Noun functions to assist with autoloading
- Clean up build process

## [0.9.13]

- Added tests for comment-based-help for all parameters
- Added multiselect switch for listbox and listview
- Changed panel output to be consistent (always build complex object)
- Allow setting of ListView display columns when no content provided

## [0.9.12]

- Added ShowForValue() method and switch to Window
- Create variables for all named controls

## [0.9.11]

- Changed model for Attached Property (use Register-WPFAttachedPropertyType)

## [0.9.10]

- Added BYOC cmdlets (Register-WPFDSL*)

## [0.9.9]

- Added several new controls
- Added support for hidden controls in data entry grid

## [0.9.8]

- Added RadioButton control
- Updated build process to update markdown docs

## [0.9.7]

- Added GroupBox control
- Added contributing.md, changelog.md,
- updated CBH on all controls
- Added comment to all examples explaining what they showed
- Renamed Add-TreeViewContents to Add-TreeViewContent

## [0.9.6]

- Added border control

## [0.9.5]

- Added =Property parameter to Window and Dialog functions

## [0.9.4]

- Added dockpanel
- refactored creation of control objects
- Cache types imported with add-type -assemblyname WindowsPresentation