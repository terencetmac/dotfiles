" Set the shell to bash if using vim
if &shell =~# 'fish$'
    set shell=bash
endif

set encoding=utf-8              " Necessary to show Unicode glyphs
set showmode                    " always show what mode we're currently editing in
set nocompatible                " be improved, required, removes VI compatibility mode

" Tabs vs Spaces
set tabstop=2                   " a tab is four spaces
set softtabstop=2               " a tab is four spaces when editing
set expandtab                   " <tab> becomes a shortcut for 'insert four spaces'
set nowrap                      " don't wrap lines

" Visual Settings
set number                      " show line numbers
set relativenumber              " shows numbers relative to the current line
set showcmd                     " show the very last command in the bottom right
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set smartindent
set hlsearch                    " Hightlight words during search
set showmatch                   " Always show matching parenthesis when one is hightlighted
set lazyredraw                  " redraw only when we need to
set shiftwidth=2                " number of spaces to use for autoindenting
set textwidth=120               " Maximum width of the editor
set colorcolumn=120             " set a colored column to avoid going too far to the right
set scrolloff=2                 " 2 lines above/below cursor when scrolling
set ruler                       " show cursor position in status bar
set matchpairs+=<:>             " specially for html
set laststatus=2                " use 2 lines for status bar

set hidden
set history=100
set undolevels=100

set splitright                  " create a new split to the right when calling :new

" Editor Settings
set ignorecase                  " case insensitive search
set smartcase                   " but becomes case sensitive if you type uppercase characters
set smartindent                 " smart auto indenting
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:, " Show tabs, trailing whitespace and spaces
nmap <silent> ,/ :nohlsearch<CR>  " clears search buffer with ,/
cmap w!! w !sudo tee % >/dev/null " allows editing for sudo files with w!!

" Ignore swp pyc and other python(ish) related files
set wildignore="*.swp, *.pyc, *.o"

set nobackup
set noswapfile

" Change terminal title
set title

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set .md files type to markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" markdown language support
let g:markdown_fenced_languages = ['c', 'go', 'typescript', 'sql', 'html', 'python', 'bash=sh', 'javascript', 'css', 'sass']
let g:markdown_syntax_conceal = 0

"""""""""""""""""""""""""""
"    Plugins List         "
"                         "
"""""""""""""""""""""""""""

autocmd BufWritePre *.js :normal gggqG
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd filetype html,xml set listchars-=tab:>. " hide tabs on HTML and XML files

syntax on
syntax enable
filetype plugin indent on       " allows filetype detection

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Plugin management using junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" Javascript bundle for syntax highlighting and improved indentation

Plug 'https://github.com/pangloss/vim-javascript.git'

  " Handles JSX syntax highlighting and indentation
  Plug 'https://github.com/mxw/vim-jsx'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
