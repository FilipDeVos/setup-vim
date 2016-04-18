
if (-not (Test-Path C:\ProgramData\chocolatey\bin\choco.exe)) {
    write-host "This script needs chocolatey to be installed"
    Exit
}

choco install vim

. $PSScriptRoot\installConfigOnly.ps1
