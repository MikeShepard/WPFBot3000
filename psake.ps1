# PSake makes variables declared here available in other scriptblocks
# Init some things
Properties {
    # Find the build folder based on build system
    $ProjectRoot = $ENV:BHProjectPath
    if (-not $ProjectRoot) {
        $ProjectRoot = Resolve-Path "$PSScriptRoot\.."
    }
    $modulePath=$env:BHModulePath
    $Timestamp = Get-Date -UFormat "%Y%m%d-%H%M%S"
    $PSVersion = $PSVersionTable.PSVersion.Major
    $TestFile = "TestResults_PS$PSVersion`_$TimeStamp.xml"
    $lines = '----------------------------------------------------------------------'

    $Verbose = @{}
    if ($ENV:BHCommitMessage -match "!verbose") {
        $Verbose = @{Verbose = $True}
    }
}

Task Default -Depends Deploy

Task Init {
    $lines
    $env:NugetApiKey
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH*
    "`n"
    Set-ModuleFunctions -FunctionsToExport '*'
    Set-ModuleAliases -AliasesToExport '*'

}

Task Docs -Depends Init {
    if(test-path $ModulePath\Docs){
      Remove-Item $ModulePath\Docs -Recurse -Force -ErrorAction SilentlyContinue
    }
    Import-Module $ENV:BHPSModuleManifest -force -Global -verbose
    New-MarkdownHelp -Module $env:BHProjectName -OutputFolder $ModulePath\Docs
}

Task Test -Depends Docs {
    $lines
    "`n`tSTATUS: Testing with PowerShell $PSVersion"

    # Testing links on github requires >= tls 1.2
    $SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $TestTags=@{}
    #only do CI-tagged tests on appveyor
    If ($ENV:BHBuildSystem -eq 'AppVeyor') {
        $TestTags=@{ExcludeTag='Local'}
    }
    # Gather test results. Store them in a variable and file
    $TestResults = Invoke-Pester -Path $ProjectRoot\Tests -PassThru -OutputFormat NUnitXml -OutputFile "$ProjectRoot\$TestFile" @TestTags
    [Net.ServicePointManager]::SecurityProtocol = $SecurityProtocol

    # In Appveyor?  Upload our tests! #Abstract this into a function?
    If ($ENV:BHBuildSystem -eq 'AppVeyor') {
        (New-Object 'System.Net.WebClient').UploadFile(
            "https://ci.appveyor.com/api/testresults/nunit/$($env:APPVEYOR_JOB_ID)",
            "$ProjectRoot\$TestFile" )
    }

    Remove-Item "$ProjectRoot\$TestFile" -Force -ErrorAction SilentlyContinue
    # Failed tests?
    # Need to tell psake or it will proceed to the deployment. Danger!
    if ($TestResults.FailedCount -gt 0) {
        Write-Error "Failed '$($TestResults.FailedCount)' tests, build failed"
    }
    "`n"
}

Task Build -Depends Test {
    $lines

    # Load the module, read the exported functions, update the psd1 FunctionsToExport
    Set-ModuleFunctions
    Set-ModuleAliases

    # Bump the module version if we didn't already
    Try {
        $GalleryVersion = Get-NextNugetPackageVersion  -Name $env:BHProjectName -ErrorAction Stop
        $GithubVersion = Get-MetaData -Path $env:BHPSModuleManifest -PropertyName ModuleVersion -ErrorAction Stop
        if ($GalleryVersion -ge $GithubVersion) {
            Update-Metadata -Path $env:BHPSModuleManifest -PropertyName ModuleVersion -Value $GalleryVersion -ErrorAction stop
        }
    } Catch {
        "Failed to update version for '$env:BHProjectName': $_.`nContinuing with existing version"
    }
}

Task Deploy -Depends Build {
    $env:NugetApiKey
    $lines
    if (
        $ENV:BHBuildSystem -ne 'Unknown' -and
        $ENV:BHBranchName -eq "master" -and
        $ENV:BHCommitMessage -match '!deploy'
    ) {
        'Deploying to PS Gallery-via Publish-Module'
        # $Params = @{
        #     Path    = "$ProjectRoot"
        #     Force   = $true
        #     Recurse = $false # We keep psdeploy artifacts, avoid deploying those : )
        # }
        #Invoke-PSDeploy @Verbose @Params
        Publish-Module -name $env:BHProjectName -NuGetApiKey $env:NugetApiKey
    }
}