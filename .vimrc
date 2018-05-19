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

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deoplete.nvim'
Plug 'eagletmt/ghcmod-vim'
Plug 'wincent/command-t', {
    \   'tag': '5.0.2',
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }
Plug 'othree/html5.vim'
Plug 'vim-syntastic/syntastic'
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

" When set to "all", a fold is closed when the cursor isn't in it and
" its level is higher than 'foldlevel'.  Useful if you want folds to
" automatically close when moving out of them.
" set foldclose=all

" When non-zero, a column with the specified width is shown at the side
" of the window which indicates open and closed folds.  The maximum
" value is 12.
" set foldcolumn=0

" When off, all folds are open.  This option can be used to quickly
" switch between showing all text unfolded and viewing the text with
" folds (including manually opened or closed folds).  It can be toggled
" with the |zi| command.  The 'foldcolumn' will remain blank when
" 'foldenable' is off.
set foldenable

" The expression used for when 'foldmethod' is "expr".  It is evaluated
" for each line to obtain its fold level.  See |fold-expr|.
" set foldexpr:"0"

" Used only when 'foldmethod' is "indent".  Lines starting with
" characters in 'foldignore' will get their fold level from surrounding
" lines.  White space is skipped before checking for this character.
" The default "#" works well for C programs.  See |fold-indent|.
" set foldignore:#

" Sets the fold level: Folds with a higher level will be closed.
" Setting this option to zero will close all folds.  Higher numbers will
" close fewer folds.
set foldlevel=1

" Sets 'foldlevel' when starting to edit another buffer in a window.
" Useful to always start editing with all folds closed (value zero),
" some folds closed (one) or no folds closed (99).
" This is done before reading any modeline, thus a setting in a modeline
" overrules this option.  Starting to edit a file for |diff-mode| also
" ignores this option and closes all folds.
" set foldlevelstart=-1

" The start and end marker used when 'foldmethod' is "marker".  There
" must be one comma, which separates the start and end marker.  The
" marker is a literal string (a regular expression would be too slow).
" set foldmarker:{{{,}}}

" The kind of folding used for the current window.  Possible values:
" |fold-manual|	manual	    Folds are created manually.
" |fold-indent|	indent	    Lines with equal indent form a fold.
" |fold-expr|	expr	    'foldexpr' gives the fold level of a line.
" |fold-marker|	marker	    Markers are used to specify folds.
" |fold-syntax|	syntax	    Syntax highlighting items specify folds.
" |fold-diff|	diff	    Fold text that is not changed.
set foldmethod=syntax

" Sets the number of screen lines above which a fold can be displayed
" closed.  Also for manually closed folds.  With the default value of
" one a fold can only be closed if it takes up two or more screen lines.
" Set to zero to be able to close folds of just one screen line.
" Note that this only has an effect on what is displayed.  After using
" "zc" to close a fold, which is displayed open because it's smaller
" than 'foldminlines', a following "zc" may close a containing fold.
" set foldminlines=1

" Sets the maximum nesting of folds for the "indent" and "syntax"
" methods.  This avoids that too many folds will be created.  Using more
" than 20 doesn't work, because the internal limit is 20.
" set foldnestmax=20

" Specifies for which type of commands folds will be opened, if the
" command moves the cursor into a closed fold.  It is a comma separated
" list of items.
" set foldopen:

" An expression which is used to specify the text displayed for a closed
" fold.  See |fold-foldtext|.
" set foldtext

" yank to end of line
nmap Y y$

" semicolon as command
nmap ; :

" column mark
nmap ' `

" set textwidth for lines
set textwidth=80

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
colorscheme solarized

" set formatoptions
set formatoptions=n

" enable tagstack
set tagstack

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" get hex for file
command -bar Hexmode call ToggleHex()
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" helper function to toggle hex mode
function! ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" set mapleader
let mapleader = ","

" alternate
nmap <silent> <Leader>a <C-^>

" disable extra conf confirm for ycm
let g:ycm_confirm_extra_conf = 0
" let g:ycm_collect_identifiers_from_tags_files=1
" let g:ycm_auto_trigger=0
" let g:ycm_filetype_blacklist = {
"     \ 'php' : 1,
"     \ 'js' : 1
"     \}

nmap <silent> <C-e> :make<CR>

" enable completion in command mode
set wildmenu

" ignore the following file patterns
set wildignore+=tmp,.git,*.obj,*.o,*.png,*.jpg,*.gif,*.bmp,node_modules,dist

" set command t options
let g:CommandTMaxHeight=5
let g:CommandTMatchWindowReverse=1

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

" let NERDTreeIgnore=['\~$', 'dist', 'build', 'node_modules', 'bower_components']
let NERDTreeRespectWildIgnore=1
