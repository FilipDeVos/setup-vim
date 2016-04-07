choco install vim

cmd.exe /c mklink $env:userprofile\_vimrc $PSScriptRoot\_vimrc
cmd.exe /c mklink $env:userprofile\_gvimrc $PSScriptRoot\_gvimrc
cmd.exe /c mklink /D $env:userprofile\vimfiles $PSScriptRoot\vimfiles
cmd.exe /c mklink /D $env:userprofile\.vim $PSScriptRoot\vimfiles