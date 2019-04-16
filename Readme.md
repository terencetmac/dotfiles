# My VIM Configuration and Plugins

## Cheatsheet

### Editing

- `ea` - append at the end of word
- `J` - join line below to the current one
- `cc` / `S` - delete line at cursor and substitute text
- `xp` - swap 2 letters (delete & paste)
- `<C-n>`, `<C-p>` - next/previous word completion in Insert Mode
- `<C-w>` / `<C-u>` - erase word / erase line in Insert Mode
- `dap` - delete around paragraph

### Marking Text

- `v` / `V` - start visual mode / linewise Visual Mode
- `o` / `O` - move to ends of marked area in Visual Mode
- `~` - switch case in visual mode

### Searching

- `*` / `g*` - search for word under cursor / search for partial word under cursor

### Navigation

- Switching between tabs next: `gt`, prev: `gT`, numbered: `nnngt`
- `:ls` - list all buffers

### Registers

- `:reg` - show named registers and what's in them
- `"5p` - paste what's in register "5

## Plugins

### Editor
- Vim Status Bar: (Lightline)[https://github.com/itchyny/lightline.vim] - light and configurable statusline

### Convenience
These plugins mimic certain functionality that I've gotten used to in Sublime Text.

#### (vim-multiple-cursors)[https://github.com/terryma/vim-multiple-cursors]

Sublime Text-like multicursor

- `<C-n>` starts multicursor and adds a virtual cursor + selection on the match
  - `<C-n>` adds a new virtual cursor + selection on the next match
  - `<C-x>` skips the next match
  - `<C-p>` removes the current virtual cursor + selection and go back on previous match

Remapped `<C-n>` to `<C-d>` to be retain Sublime Text shortcut key

#### (surround.vim)[https://github.com/tpope/vim-surround]

Wraps text in parentheses, brackets, quotes, tags etc.

- `cs"'` inside text to change the surrounding quote
- `cs'<q>` to change surround tag
- `cst"` to wrap line in `"`
- `ds"` to remove delimiters
- `ysiw]` to wrap text object `iw` in `[]`
- `yss)` to wrap entire line in `{}`

Reads like `change surrounding` and `delete surrounding`

## Interesting Features

### Tabs

**Saving current session of open tabs**
- Open any number of tabs
- `<Esc>` to enter command mode
- `:mksession header-files-work.vim`
- start vim with session `vim -S header-files-work.vim` or `:source header-files-work.vim`
- save new set of tabs with `:mks!`

### Code writing
**Copy/Cut lines without line numbers**
- `mk` to mark point with alphabet `k`
- move down to any page
- `y'k` to yank all lines from start to end
- `d'k` to delete all lines from start to end`

**Indenting blocks of code**
- `=i{` indents all code within the `{`
- `>i{` / `<i{` to increase / decrease indentation within a block

### Navigation
**File Explorer**
- using `netrw`, `:Texplore` opens the explorer in a new tabpage. Currently mapped to `<C-k><C-b>`

**Splitting Windows**
- `:split filename`, splits window horizontally and loads filename
- `:vsplit filename`, splits window vertically and loads filename
- `:close`, closes current window`
- `<C-w>j`, moves cursor to another window in that direction
- `<C-w>| / _`, maximizes current window horizontally / vertically
- `<C-w>=`, makes all windows equal size
- Resize window
  - `<C-w>[n]` + `-` / `+` for height, `<` / `>` for width, by `[n]`

**Bookmarks**
- in normal mode, `m<x>` where <x> is any lowercase letter from a-z
- `:marks` views all book marks
- `<backtick>a` jumps to bookmark `a`
- use capital letters for Global bookmarks across files
- use `'` instead of `<backtick>` to jump to the beginning of the bookmarked line

**Code folding**
- `:5,20fo` folds code from line 5 to 20
- `zf20j` folds 20 lines from `j`
- `zf` creates a fold by fold type, e.g. `indent`
- `zo` opens the fold
- `zc` closes the fold`
- `za` toggles code folding at current line, remapped to `<Space>`
- `zd` to delete the fold at the cursor, `zD` to do it recursively
- saving folds for the file `autocmd BufWinLeave *.* mkview` `autocmd BufWinEnter *.* silent loadview`

## Advanced Features to consider learning and using

[ ] Record a sequence of steps and replay it on multiple lines (Macros)

[ ] Remotely edit a fole with `openssh-client`'s `scp`

## Resources

- Learn [Vimscript the Hard Way](learnvimscriptthehardway.stevelosh.com)
- [Vim Galore](https://github.com/mhinz/vim-galore)
