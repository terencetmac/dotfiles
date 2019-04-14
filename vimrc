" TODOS:
" - Install & setup eslint + option to toggle prettier
" Plugins
"   - Tabular: for auto aligning code, e.g. MD Tables

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
Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-t> :Files<CR>

" Theme
Plug 'lifepillar/vim-solarized8'
" vim-colorssolarized

Plug 'erichdongubler/vim-sublime-monokai'

" Status Line
Plug 'itchyny/lightline.vim'

" Code
" Syntastic
Plug 'vim-syntastic/syntastic'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

" Reload .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Make backspace delete sensibly
set backspace=indent,eol,start

" Search - Ignore case when search pattern is all lowercase
set smartcase
set ignorecase

" Normal Mode
" Bind Enter key to add an extra line
map <CR> o<Esc>k

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
colorscheme sublimemonokai
set termguicolors

set laststatus=2
set noshowmode

" Lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'component_expand': {
  \    'syntastic': 'SyntasticStatuslineFlag',
  \  },
  \  'component_type': {
  \    'syntastic': 'error',
  \  }
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']
