param ($Task = 'Default')

# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

if($env:APPVEYOR_BUILD_FOLDER){
    Install-Module Psake, PSDeploy, BuildHelpers,Platyps -force
    Install-Module Pester -Force -SkipPublisherCheck
}
Import-Module Psake, BuildHelpers, Platyps

$env:NugetApiKey

Set-BuildEnvironment -Force

Invoke-psake -buildFile .\psake.ps1 -taskList $Task -nologo
exit ( [int]( -not $psake.build_success ) )