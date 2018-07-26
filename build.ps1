param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Install-Module Psake, PSDeploy, BuildHelpers,Platyps -force
Install-Module Pester -Force -SkipPublisherCheck
Import-Module Psake, BuildHelpers, Platyps

Set-BuildEnvironment

[System.Threading.Thread]::CurrentThread.GetApartmentState()

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )