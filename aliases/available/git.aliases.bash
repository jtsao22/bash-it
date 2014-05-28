# Git Aliases
alias grm='git rm $@'
alias ga='git add $@'
alias gc='git commit -m $@'
alias gco='git checkout $@'
alias gs='git status'
alias gpl='git pull $@'
alias gps='git push $@'
alias gd='git diff $@'
alias gl='git log --pretty=oneline --abbrev-commit --color --max-count=50'
alias gb='git branch'

# Git autocompletion for aliases
__git_complete grm _git_rm
__git_complete ga _git_add
__git_complete gc _git_commit
__git_complete gco _git_checkout
__git_complete gpl _git_pull
__git_complete gps _git_push
__git_complete gd _git_diff
__git_complete gl _git_log
__git_complete gb _git_branch
