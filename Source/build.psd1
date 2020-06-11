@{
    Path = "MyChefModule.psd1"
    OutputDirectory = "..\bin\MyChefModule"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Classes','Private','Public'
    PublicFilter = 'Public\*.ps1'
    VersionedOutputDirectory = $true
}
