# My VIM Configuration and Plugins

## Cheatsheet

### Navigation

- Switching between tabs next: `gt`, prev: `gT`, numbered: `nnngt`

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
