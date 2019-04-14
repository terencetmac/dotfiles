" TODOS:
" - Install & setup eslint + option to toggle prettier
" Plugins
"   - Tabular: for auto aligning code, e.g. MD Tables
"   - Deoplete: for autocomplete
"   - Emmet: for easier HTML/CSS/JSX expansion

" Install Plug if not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Comments
Plug 'tomtom/tcomment_vim'
nnoremap <silent> <C-l> :TComment<CR>

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-t> :Files<CR>

" Theme
Plug 'lifepillar/vim-solarized8'
" vim-colorssolarized

Plug 'erichdongubler/vim-sublime-monokai'

Plug 'mhartington/oceanic-next'

" Status Line
Plug 'itchyny/lightline.vim'

" Code
" Syntax Checking
Plug 'w0rp/ale'

" Syntax highlighting
Plug 'pangloss/vim-javascript'      " Javascript
let g:javascript_plugin_jsdoc = 1   " Syntax highlighting for JSDoc
let g:javascript_plugin_flow = 1    " Syntax highlighting for Flow

Plug 'mxw/vim-jsx'                  " JSX

" Convenience
Plug 'terryma/vim-multiple-cursors' " Sublime Text-like multi selection
Plug 'tpope/vim-surround'           " Surrounds text with parens, brackets, etc
.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursor
let g:multi_cursor_start_word_key = '<C-d>'
let g:multi_cursor_next_key = '<C-d>'
" /vim-multiple-cursor


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

" Reload .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" General Settings
set hidden
set history=100
set undolevels=100
set visualbell            " don't beep
set noerrorbells          " don't beep
set nobackup
set noswapfile
set title                 " change terminal title

" Search - Ignore case when search pattern is all lowercase
set smartcase
set ignorecase
set hlsearch              " highlight words during search
nnoremap // :noh<CR><esc> " Clears highlighted words on Esc
" Editor setup
set encoding=utf-8			  " Necessary to show Unicode glyphs
set showmode				      " always show what mode we're currently in
set nocompatible			    " be improvied, required, removes VI compatibility mode
set textwidth=120         " maximum width of the editor
set colorcolumn=120       " set colored column to avoid going too far right

set tabstop=2				      " a tab is 2 spaces
set softtabstop=2			    " a tab is 2 spaces when editing
set expandtab				      " <tab> becomes a shortcut for insert two spaces
set nowrap				        " don't wrap lines
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting
set smartindent
set shiftwidth=2          " number of spaces to use for autoindenting

set backspace=indent,eol,start " Make backspace delete sensibly
" set list
" set listchars=tab>.trail:.,extends:#,nbsp:, " Show tabs, trailing whitespace and spaces

" StatusLine
set laststatus=2

" Code Settings
set matchpairs+=<:>       " Match pairs for HTML

" Visual Settings
set number                " show line numbers
set relativenumber        " shows numbers relative to the current line
set showmatch             " shows matching parenthesis when one is highlighted
set lazyredraw            " redraw only when we need to

" General bindings
" noremap j gj              " moves cursor by file line instead of display line
" noremap k gk              " moves cursor by file line instead of display line

" Normal Mode

map <CR> o<Esc>k          " Bind Enter key to add an extra line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer (netrw vs. NerdTree)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw vs. NerdTree
" Absolute width of netrw window
let g:netrw_winsize = -28

" tree-view
let g:netrw_liststyle = 3

" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" open file in a new tab
let g:netrw_browse_split = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
" colorscheme solarized8
syntax on
colorscheme OceanicNext
if (has("termguicolors"))
  set termguicolors
endif

" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \}
let g:ale_sign_error = '*'   " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
