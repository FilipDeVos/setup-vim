# setup-vim
Repo to setup my vim config.

This system assumes that you have chocolatey properly installed and a powershell version > 3

To use this, clone the repository somewhere (and make sure the submodules are also cloned) and run the install.ps1 script from and admin powershell console. This will do the following:

- install the latest vim for windows 
- create a symbolic link to \_vimrc in the %userprofile% folder
- create a symbolic link to \_gvimrc in the %userprofile% folder
- create a directory link to vimfiles in the %userprofile% folder


