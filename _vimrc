""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim options on Windows 10 attempt some linux compatibility
" 
" Author: Filip De Vos
" Last updated: May 25, 2016 
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
language messages en_US.UTF-8 

if &compatible
    set nocompatible                   " don't be compatible with vi
endif

"==========================================================
" Enable Pathogen the way it should...
"==========================================================
" There is some bug on windows where pathogen doesn't find the home folder
if has('win32') || has('win64')
  set runtimepath=$HOME/vimfiles,$VIMRUNTIME,$HOME/vimfiles/after
endif

"Load pathogen as documented.
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

"==========================================================
" use the color scheme
"==========================================================
colorscheme solarized 
set background=light

"==========================================================
" Set the editor config executable. 
"==========================================================
if has('win32') || has('win64')
    let g:EditorConfig_exec_path = $HOME.'\vimfiles\bundle\vim-editorconfigcore\lib\editorconfig.exe'
endif

"==========================================================
" Remappings. 
"==========================================================
let mapleader=','                   " set mapleader to something more convenient
let g:mapleader=','                 " set mapleader to something more convenient

" traverse virtual lines unless you specify a number.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

noremap <F1> <ESC>                      " Fat fingering escape is annoying and I don't use F1
noremap! <F1> <ESC>                     " Fat fingering escape is annoying and I don't use F1   
noremap <silent> <F2> :set list!<CR>    " Show end of line marker 
noremap <F5> :buffers<CR>:buffer<Space> " Show buffer menu and pretype selection. my favorite shortkey. 
noremap <F8> :retab<CR>                 " since I need to retab soo often, a shortkey is handy.
noremap <F11> :resize -2<CR>            " resize window splits
noremap <F12> :resize +2<CR>            " resize window splits

noremap <C-Tab> :bn<CR>                 " Easily go to next buffer.
noremap <C-S-Tab> :bp<CR>               " Easily go to previous buffer.
noremap! <C-Tab> <Esc>:bn<CR>           " Easily go to next buffer in insert and command mode.
noremap! <C-S-Tab> <Esc>:bp<CR>         " Easily go to previous buffer in insert and command mode.

noremap <leader>v :e! $MYVIMRC<CR>      " shortcut to load config
noremap Q gqap                              " use Q for formatting
noremap <silent> <leader>/ :let @/=""<CR>  " shortcut to clear highlighted searches

" Use ctrl-[hjkl] to select the active split!
noremap <silent> <c-k> :wincmd k<CR>                                                                                                                       
noremap <silent> <c-j> :wincmd j<CR>                                                                                                                       
noremap <silent> <c-h> :wincmd h<CR>                                                                                                                       
noremap <silent> <c-l> :wincmd l<CR>

nnoremap K i<CR><Esc>                   " remap K to split a line (J to join a line).
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>  " Replace the word under the cursor
nnoremap <Leader>t :CtrlP<CR><CR>       " call CtrlP
nnoremap <CR> :nohlsearch<CR>/<BS>      " Clear the search buffer when hitting return.
nnoremap gf <C-W>gf                     " let the file searcher look recursive through the path to open a file.

vmap <tab> >gv                      " Tab to indent in visual mode.
vmap <s-tab> <gv                    " Shift+Tab to unindent in visual mode.

"==========================================================
" Some basic vim fixes.
"==========================================================
set vb t_vb=                      " prevent vim from beeping when a command doesn't work
set shortmess=aIoO                " Working Show short messages, no intro.

" Show airline even if only 1 buffer open
let g:airline#extensions#tabline#enabled = 1

" Note that this gets overruled by .editorconfig
set tabstop=4
set shiftwidth=4
set expandtab

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
        set path+=c:/CodeUS/**
        set path+=c:/CodePriv/**
    endif
catch
endtry
set suffixesadd=.cs,.sql,.dat,.xml,.proj,.bcp

"==========================================================
" Fix my common typos
"==========================================================
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


