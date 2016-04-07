""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim options on Windows 10 attempt some linux compatibility
" 
" Author: Filip De Vos
" Last updated: April 7, 2016 
"
" To use this conveniently I work like this: 
"  - check out the gist in my Git working folder with:
"      cd ~/Documents/WorkingGit/
"      git clone git://gist.github.com/258688.git vimconfig
"  - Then create a symbolic link in my home directory to the conf files
"      ln ~/Documents/WorkingGit/vimconfig/_vimrc _vimrc
"  - then start vim to check out your new settings.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
language messages en_US.UTF-8 

if &compatible
    set nocompatible                   " don't be compatible with vi
endif

"==========================================================
" Enable Pathogen the way it should...
"==========================================================
" Trigger pathogen which will itterate through the addon folders. 
if has('win32') || has('win64')
  set runtimepath=$USERPROFILE/vimfiles,$VIMRUNTIME,$USERPROFILE/vimfiles/after
endif
runtime bundle\vim-pathogen\autoload\pathogen.vim
execute pathogen#infect()
filetype off

"==========================================================
" Switch on syntax highlighting if it wasn't on yet.
"==========================================================
if !exists("syntax_on")
  syntax on

endif

:filetype plugin indent on          " re-enable the filetype plugins.
let g:autofenc_enable=1

" use the color scheme
colorscheme solarized 
set background=light
"==========================================================
" Remappings. 
"==========================================================
let mapleader=","                   " set mapleader to something more convenient
let g:mapleader=","                 " set mapleader to something more convenient   


map <F1> <ESC>                      " Fat fingering escape is annoying
map! <F1> <ESC>                     " Fat fingering escape is annoying    
nmap <silent> <F2> :set list!<CR>   " Show end of line marker 

" Show buffer menu and pretype selection. 
:nnoremap <F5> :buffers<CR>:buffer<Space> 
map <F8> :retab<CR>                 " since I need to retab soo often, a shortkey is handy.
map <F11> :resize -2<CR>            " resize window splits
map <F12> :resize +2<CR>            " resize window splits
map <C-Tab> :tabnext<CR>            " Easily go to next tab.

nmap <leader>s :so $MYVIMRC<CR>     " shortcut to reload config
nmap <leader>v :e! $MYVIMRC<CR>     " shortcut to load config
nmap Q gqap                         " use Q for formatting
nmap <silent> <leader>/ :let @/=""<CR> " shortcut to clear highlighted searches

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>

:nnoremap K i<CR><Esc> " remap K to split a line.

" Replace the word under the cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" call CtrlP
:nnoremap <Leader>t :CtrlP<CR><CR>

" Clear the search buffer when hitting return.
:nnoremap <CR> :nohlsearch<CR>/<BS>       

" let the file searcher look recursive through the path to open a file.
:nnoremap gf <C-W>gf

noremap <S-Tab> <C-W>w              " Easily go to next buffer.
inoremap <S-Tab> <C-O><C-W>w        " Easily go to next buffer.
cnoremap <S-Tab> <C-C><C-W>w        " Easily go to next buffer.


"nnoremap / /\v                     " Fix regexes
"vnoremap / /\v                     " Fix regexes

vmap Q gq                           " use Q for formatting
vmap <tab> >gv                      " Tab to indent in visual mode.
vmap <s-tab> <gv                    " Shift+Tab to unindent in visual mode.

"==========================================================
" Some basic vim fixes.
"==========================================================
set vb t_vb=                      " prevent vim from beeping when a command doesn't work
set shortmess=aIoO                " Working Show short messages, no intro.

"set statusline=%F    " full path to file in the buffer
"set statusline+=%m   " rodified flag in square brackets
"set statusline+=%r   " readonly flag in square brackets
"set statusline+=%h   " help flag in square brackets
"set statusline+=%w   " preview flag in square brackets
"set statusline+=[%L] " number of lines
"set statusline+=[%{&ff}] " current file format
"set statusline+=%y   " current syn
"set statusline+=[%p%%] " current % into file
"set statusline+=[%04l,%04v] " Current line and column 

let g:airline#extensions#tabline#enabled = 1

set tabstop=4
set shiftwidth=4
set expandtab

" Set base path to %home%/Documents
"try
"    if has("win32")
"        cd ~\Documents\
"    endif
"catch
"endtry

" Disabling autochdir as its a pita with CtrlP
"set autochdir                     " Switch to the current file directory
set history=1000                  " remember more history
set undolevels=1000               " remember more undo history
set nobackup                      " disable backup files. 
set nowritebackup                 " disable backup files. 
set noswapfile                    " disable swap files. 
set hidden                        " Hide buffers instead of closing them
set wildmenu                      " make tab completion for files/buffers act like bash
set showcmd                       " show incomplete commands

"==========================================================
" Usability tweaks
"==========================================================
set showmatch                     " show matching brace
set backspace=eol,start,indent    " make backspace not such a pain
set ruler                         " show cursor position
set cursorline                    " show the line where the cursor is
hi clear cursorline               " show the line where the cursor is
set number                        " show line numbers
set scrolloff=3                   " keep 3 lines of context when reaching the end of the screen.
set laststatus:2                  " always show status line
set nowrap                        " don't wrap long lines
"let &sbr = nr2char(8618).' '      " Show  at the beginning of wrapped lines.
set printoptions+=syntax:y        " Print syntax highlighting.
set printoptions+=number:y        " Print line numbers.

if v:version >= 703
  set relativenumber                " let numbering be relative to cursor position
endif

"==========================================================
" Seach customizations...
"==========================================================
set hlsearch                      " switch on search pattern highlighting
set incsearch                     " enable incremental searching
set ignorecase                    " enable case insensitive search 
set smartcase                     " unless there are uppercase letters in the pattern
set wrapscan                      " wrap to top of file
set gdefault                      " make search global by default

"==========================================================
" File Search customizations...
"==========================================================
set wildignore=.svn,.git,*.ssc,_Resharper,/obj/    " ignore these extensions when doing tab completion.
set path+=./**
try
    if MySys() == "windows"
        set path+=c:/CodeFS/**
        set path+=c:/CodeMorph/**
        set path+=c:/CodePriv/**
    endif
catch
endtry
set suffixesadd=.cs,.sql,.dat,.xml,.proj

"===============================Working===========================
" Fix my common typos
"=========================Morph=================================
ia Craeting Creating
ia eariler earlier
ia foreahc foreach
ia fucntion function
ia funciton function
ia funtion function
ia htis this
ia retunr return
ia reutrn return
ia sleect select
ia teh the
ia tihs this


