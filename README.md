# setup-vim
Repo to setup my vim config.

This system assumes that you have chocolatey properly installed and a powershell version > 3

To use this, clone the repository somewhere (and make sure the submodules are also cloned) and run the install.ps1 script from and admin powershell console. This will do the following:

- install the latest vim for windows 
- create a symbolic link to \_vimrc in the %userprofile% folder
- create a symbolic link to \_gvimrc in the %userprofile% folder
- create a directory link to vimfiles in the %userprofile% folder

I recommend installing vim from https://github.com/vim/vim-win32-installer/releases as the versions of vim on chocolatey or the vim.org site don't have +directx enabled. You can run the installConfigOnly.ps1 script to setup the config files on your system. 

My vim config results in a layout like this

![Example of how vim looks with this config](https://raw.githubusercontent.com/filipdevos/setup-vim/master/example.png)
