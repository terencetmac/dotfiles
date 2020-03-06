# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden "!{node_modules}/*"'

# Git Shortcuts
alias gs='git status'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gb='git branch'
alias gpo='git push origin'
alias gamend='git commit --amend'
alias gunstage='git reset HEAD'
alias gsync='git fetch upstream && git checkout master && git merge upstream/master'
alias gg='git grep'

# Navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
