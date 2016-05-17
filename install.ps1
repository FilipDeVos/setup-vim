
if (-not (Test-Path C:\ProgramData\chocolatey\bin\choco.exe)) {
    write-host "This script needs chocolatey to be installed"
    Exit
}

# Note that this installation of vim is based on cream. This 
# version does NOT have +directx so font rendering is bad. 
choco install vim

. $PSScriptRoot\installConfigOnly.ps1
