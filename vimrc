" TODOS:
" Plugins
"   - Tabular: for auto aligning code, e.g. MD Tables
"   - Deoplete: for autocomplete
"   - Emmet: for easier HTML/CSS/JSX expansion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Fuzzy Search - Uses ripgrep, install with brew on macos
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-t> :Files<CR>

" Themes
Plug 'lifepillar/vim-solarized8'
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

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'mxw/vim-jsx'                  " JSX
Plug 'prettier/vim-prettier', { 'do': 'npm instqall' }  " Prettier


" Convenience
Plug '907th/vim-auto-save'          " Autosave when leaving insert mode
Plug 'terryma/vim-multiple-cursors' " Sublime Text-like multi selection
Plug 'tpope/vim-surround'           " Surrounds text with parens, brackets, etc
Plug 'jiangmiao/auto-pairs'         " Auto closing parents, brackets and quotes.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \}
" /lightline

" vim-auto-save
let g:auto_save = 1                 " enable autosave on Vim startup
" /vim-autosave

" vim-multiple-cursor
let g:multi_cursor_start_word_key = '<C-d>'
let g:multi_cursor_next_key = '<C-d>'
" /vim-multiple-cursor

" netrw
let g:netrw_winsize = -28           " Absolute width of netrw window
let g:netrw_liststyle = 3           " tree-view
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
let g:netrw_browse_split = 3        " open file in a new tab
" /netrw

" ale
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \}
let g:ale_linters_explicit = 1
let g:ale_sign_error = '*'   " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 1 " Less distracting when opening a new file

nmap <silent> <Leader>aj :ALENext<CR>
nmap <silent> <Leader>ak :ALEPrevious<CR>
" /ale

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','

" Reload .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>

" General Settings
set hidden                " Allows hiding buffers with modifications not yet been written back to file
set history=100

set undolevels=100
set visualbell            " don't beep
set noerrorbells          " don't beep
set nobackup
set noswapfile
set title                 " change terminal title
set showcmd               " show already typed keys when more are expected

" Navigation
set splitbelow            " create new horizontal windows below
set splitright            " create new horizontal windows to the right

" Moving lines of code in N/I/V modes
nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" Search - Ignore case when search pattern is all lowercase
set smartcase
set ignorecase
set hlsearch              " highlight words during search
nnoremap // :noh<CR><esc> " Clears highlighted words on Esc
nnoremap n nzz            " Make search results appear in the middle of the screen
nnoremap N Nzz

" Editor setup
set encoding=utf-8			  " necessary to show Unicode glyphs
set showmode				      " always show what mode we're currently in
set nocompatible			    " uses VIM configuration instead of VI
set textwidth=120         " maximum width of the editor
set colorcolumn=120       " set colored column to avoid going too far right

set scrolloff=4           " minimal number of lines before and after cursor
set tabstop=2				      " a tab is 2 spaces
set softtabstop=2			    " a tab is 2 spaces when editing
set expandtab				      " <tab> becomes a shortcut for insert two spaces
" set nowrap				        " don't wrap lines
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting
set smartindent
set shiftwidth=2          " number of spaces to use for autoindenting
set laststatus=2          " shows 2 lines in Statusline
set wildmenu              " show possible completions of command, file names and more in status bar

set backspace=indent,eol,start " Make backspace delete sensibly

set nosol                 " Prevent the cursor from changing the current column when jumping to other lines

" set list                  " shows hidden characters

" set listchars=tab>.trail:.,extends:#,nbsp:, " Show tabs, trailing whitespace and spaces

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
noremap <Space> za        " Toggles current fold open/closed
noremap <CR> O<Esc>k      " Bind Enter key to add an extra line
noremap <C-k><C-b> :Texplore<CR> " Opens Explorer in a new Tab

" Shortcuts
noremap <Leader>json :%!python -m json.tool<CR>     " Formats current JSON file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
filetype on               " enables syntax highlighting based on file type
syntax enable             " enables syntax highlighting (previously syntax on)
colorscheme OceanicNext
if (has("termguicolors"))
  set termguicolors
endif

" Other Settings Options
" map <leader>s :source ~/.vimrc<CR> " reload VIM config
