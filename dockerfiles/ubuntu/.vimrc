" disable vi compatibility
set nocompatible

" don't wrap long lines
set nowrap

" display title
set title

" turn on line numbers
set number

" turn on column and row in status bar
set ruler

" always display status bar
set laststatus=2

" disable bell
set vb

" disable vertical separator, set fold
set fcs=vert:\ ,fold:-

" always display mode
set showmode

" turn on syntax
syntax on

" filetype options
filetype on
filetype plugin on
filetype indent on

set foldenable
set foldlevel=1
set foldmethod=syntax

" yank to end of line
nmap Y y$

" semicolon as command
nmap ; :

" column mark
nmap ' `

" vim encoding
set encoding=utf-8

" set bash shell
set shell=bash

" set $ at the end of changed line
set cpoptions+=$

" enable cursorline
set cursorline

" tilde operator
set tildeop

" spaces for tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

" disable swap
set backup
set backupdir=~/.vim/.backup
set noswapfile
set directory=~/.vim/.swp

" cursor movement
set virtualedit=all
set scrolloff=3
set sidescrolloff=12
set sidescroll=12

" search
set nohlsearch
set ignorecase
set incsearch
set smartcase

" keep buffers hidden
set hidden

" set background color
" set background=light

" set color scheme
colorscheme solarized

" set formatoptions
set formatoptions=n

" enable tagstack
set tagstack

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" set mapleader
let mapleader = ","

" alternate
nmap <silent> <Leader>a <C-^>

nmap <silent> <C-e> :make<CR>

" enable completion in command mode
set wildmenu

" ignore the following file patterns
set wildignore+=tmp,.git,*.obj,*.o,*.png,*.jpg,*.gif,*.bmp,node_modules,dist,dist-newstyle,data

" change cursor shape when in command vs insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

map <C-n> :NERDTreeToggle<CR>

let NERDTreeRespectWildIgnore=1

map <C-s> :execute "grep -r " . expand("<cword>") . " ." <Bar> cw<CR>



