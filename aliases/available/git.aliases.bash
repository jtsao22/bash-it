# Git Aliases
alias grm='git rm'
alias ga='git add'
alias gall='git add .'
alias gus='git reset HEAD'
alias gm="git merge"
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gps='git push'
alias gpo='git push origin'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
#alias gl='git log --pretty=oneline --abbrev-commit --color --max-count=50'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --graph"
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gw="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
alias gd='git diff'
alias gr='git remote'
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias gfix="git diff --name-only | uniq | xargs nvim"
# Stash aliases
alias gst="git stash"
alias gstb="git stash branch"
alias gstd="git stash drop"
alias gstl="git stash list"
# Push introduced in git v2.13.2
alias gstpu="git stash push"
alias gstpum="git stash push -m"
# Save deprecated since git v2.16.0
# - aliases now resolve to push
alias gsts="git stash push"
alias gstsm="git stash push -m"
# Alias gstpo added for symmetry with gstpu (push)
# - gstp remains as alias for pop due to long-standing usage
alias gstpo="git stash pop"
alias gstp="git stash pop"

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac

# Add autocompletion
# Use bash completion
if [ -f /usr/share/bash-completion/completions/git ]; then
	source /usr/share/bash-completion/completions/git

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
fi
