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

set nomodeline

" turn on syntax
syntax on

" filetype options
filetype on
filetype plugin on
filetype indent on

" syntax highlighting redraw time (ms)
" set rdt=10000

let s:copy = ['wl-copy', '--foreground', '--type', 'text/plain']
let s:paste = ['wl-paste', '--no-newline']

let g:clipboard = {
      \   'name': 'wl-copy',
      \   'copy': {
      \      '+': s:copy,
      \      '*': s:copy,
      \    },
      \   'paste': {
      \      '+': s:paste,
      \      '*': s:paste,
      \   },
      \   'cache_enabled': 1,
      \ }

call plug#begin('~/.local/share/nvim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'wincent/command-t', {
    \   'tag': '5.0.5',
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
" Plug 'altercation/vim-colors-solarized'
" Plug 'SirVer/ultisnips'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-pyclang'
call plug#end()

" TODO: return to this
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline+=%#warningmsg#
" set statusline+=%*

" enable ncm2
" augroup vimrc
"     au BufEnter * silent! call ncm2#enable_for_buffer()
" augroup END

set completeopt=noinsert,menuone,noselect

" configure ncm2 for c/c++
" let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so'

" configure folding
set foldenable
set foldlevel=1
set foldmethod=syntax

" yank to end of line
nmap Y y$

" semicolon as command
nmap ; :

" column mark
nmap ' `

" set textwidth for lines
" set textwidth=80

" vim encoding
set encoding=utf-8

" set bash shell
set shell=bash

" set $ at the end of changed line
set cpoptions+=$

" enable cursorline
" set cursorline

" tilde operator
set tildeop

" spaces for tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent

" disable swap
set nobackup
set noswapfile

" cursor movement
set virtualedit=insert,onemore
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
" silent! colorscheme solarized

" set formatoptions
set formatoptions+=n

" enable tagstack
set tagstack

" set mapleader
let mapleader = ","

" alternate
nmap <silent> <Leader>a <C-^>

" more natural menu selection keybindings
inoremap <silent> <C-j> <C-n>
inoremap <silent> <C-k> <C-p>

" c-e run make
nmap <silent> <C-e> :make<CR>

" enable completion in command mode
set wildmenu

" ignore the following file patterns
set wildignore+=tmp,.git,*.obj,*.o,*.png,*.jpg,*.gif,*.bmp,node_modules,dist,dist-newstyle,data,*.dSYM

" set command t options
let g:CommandTMaxHeight=5
let g:CommandTMatchWindowReverse=1
let g:CommandTTraverseSCM="pwd"

" change cursor shape when in command vs insert mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" map <C-n> :NERDTreeToggle<CR>

" let NERDTreeRespectWildIgnore=1

map <C-s> :execute "grep -r " . expand("<cword>") . " ." <Bar> cw<CR>

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" help foot out
" https://codeberg.org/dnkl/foot/wiki#ctrl-key-breaks-input-in-vim
let &t_TI = "\<Esc>[>4;2m"
let &t_TE = "\<Esc>[>4m"
