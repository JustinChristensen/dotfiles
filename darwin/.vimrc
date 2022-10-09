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
set rdt=10000

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
if has('nvim')
  Plug 'whonore/Coqtail'
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
else
"  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'wincent/command-t', {
    \   'tag': '5.0.3',
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'othree/html5.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'rust-lang/rust.vim'
Plug 'rstacruz/sparkup'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-surround'
Plug 'ElmCast/elm-vim'
call plug#end()

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" set statusline+=%(Ln %l, Col %c%)
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:deoplete#enable_at_startup = 1

set completeopt=noinsert,menuone,noselect

" let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
" let g:LanguageClient_diagnosticsEnable = 0
" let g:LanguageClient_loggingFile = "/tmp/nvim/languageclient-stdout.log"
" let g:LanguageClient_serverStderr = "/tmp/nvim/languageclient-server-stderr.log" 
" let g:LanguageClient_loggingLevel = "DEBUG"
" let g:LanguageClient_trace = "verbose"
" let g:LanguageClient_hoverPreview = "Auto"

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

" fast terminal
set tf

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
set background=light

" set color scheme
silent! colorscheme solarized

" set formatoptions
set formatoptions=n

" enable tagstack
set tagstack

" get hex for file
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" set mapleader
let mapleader = ","

" alternate
nmap <silent> <Leader>a <C-^>

inoremap <silent> <C-j> <C-n>
inoremap <silent> <C-k> <C-p>
nnoremap <silent> <C-j> :<C-U>execute v:count1 'CoqNext'<CR>
nnoremap <silent> <C-k> :<C-U>execute v:count1 'CoqUndo'<CR>

augroup vimrc
    autocmd!
    au BufEnter * call ncm2#enable_for_buffer()
augroup END

let g:ycm_confirm_extra_conf = 0

nmap <silent> <C-e> :make<CR>

" enable completion in command mode
set wildmenu

" ignore the following file patterns
set wildignore+=tmp,.git,*.obj,*.o,*.png,*.jpg,*.gif,*.bmp,node_modules,dist,dist-newstyle,data,*.dSYM

" set command t options
let g:CommandTMaxHeight=5
let g:CommandTMatchWindowReverse=1
let g:CommandTTraverseSCM="pwd"

" PHP options
" let php_htmlInStrings = 1
let php_folding = 1

" change cursor shape when in command vs insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" add some line spacing for the gui version of vim
set linespace=4

" prevent syntax highlighting on long lines
set synmaxcol=256

" GUI options
set guioptions-=r
set guioptions-=l
set guioptions-=b

map <C-n> :NERDTreeToggle<CR>

" AddTabularPattern! first_asterisk /^[^*]*\zs\*/l1c0l0

" let NERDTreeIgnore=['\~$', 'dist', 'build', 'node_modules', 'bower_components']
let NERDTreeRespectWildIgnore=1

map <C-s> :execute "grep -r " . expand("<cword>") . " ." <Bar> cw<CR>



