
if (-not (Test-Path C:\ProgramData\chocolatey\bin\choco.exe)) {
    write-host "This script needs chocolatey to be installed"
    Exit
}

choco install vim

if (-not (Test-Path $env:userprofile\_vimrc)) {
    cmd.exe /c mklink $env:userprofile\_vimrc $PSScriptRoot\_vimrc
}

if (-not (Test-Path $env:userprofile\_gvimrc)) {
    cmd.exe /c mklink $env:userprofile\_gvimrc $PSScriptRoot\_gvimrc
}

if (-not (Test-Path $env:userprofile\vimfiles)) {
    cmd.exe /c mklink /D $env:userprofile\vimfiles $PSScriptRoot\vimfiles
}

if (-not (Test-Path $env:userprofile\.vim)) {
    cmd.exe /c mklink /D $env:userprofile\.vim $PSScriptRoot\vimfiles
}