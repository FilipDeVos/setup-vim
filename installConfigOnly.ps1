Write-Host "Creating symlink to vim config files."


if (-not (Test-Path $env:userprofile\_vimrc)) {
    Write-Host "Creating symlink to _vimrc"
    cmd.exe /c mklink $env:userprofile\_vimrc $PSScriptRoot\_vimrc
}

if (-not (Test-Path $env:userprofile\_gvimrc)) {
    Write-Host "Creating symlink to _gvimrc"
    cmd.exe /c mklink $env:userprofile\_gvimrc $PSScriptRoot\_gvimrc
}

if (-not (Test-Path $env:userprofile\vimfiles)) {
    Write-Host "Creating symlink to vimfiles"
    cmd.exe /c mklink /D $env:userprofile\vimfiles $PSScriptRoot\vimfiles\
}

if (-not (Test-Path $env:userprofile\.vim)) {
    Write-Host "Creating symlink to vimfiles as .vim"
    cmd.exe /c mklink /D $env:userprofile\.vim $PSScriptRoot\vimfiles
}

Write-Host "Completed creating symlinks to vim config files."
