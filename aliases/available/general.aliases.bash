cite about-alias
about-alias 'general aliases'

# List directory contents
alias sl=ls
alias ls='exa'
alias la='exa -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'

alias vi="nvim"
alias vim="nvim"

# Alias python with p
alias p="ipython"

# Source bashrc
alias ba="source ~/.bashrc"

alias _="sudo"

which gshuf &> /dev/null
if [ $? -eq 0 ]
then
  alias shuf=gshuf
fi

alias c='clear'
alias k='clear'
alias cls='clear'

alias edit="$EDITOR"
alias pager="$PAGER"

alias open="xdg-open"

# Pianobar can be found here: http://github.com/PromyLOPh/pianobar/

alias piano='pianobar'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# Shell History
alias h='history'

# Tree
if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Directory
alias md='mkdir -p'
alias rd='rmdir'

# Cd and ls at the same time
function cs() {
    cd "$1"
    ls
}
# Add cd's autocompletion to cs command
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
fi

if shopt -q cdable_vars; then
    complete -v -F _cd -o nospace cs
else
    complete -F _cd -o nospace cs
fi

# Better cp that includes pv for showing progress bar
function pvcp()
{
    SOURCE=$1

    if [ -d $2 ]
    then
        DESTINATION=$2/`basename $SOURCE`
    else
        DESTINATION=$2
    fi

    pv ${SOURCE} | > ${DESTINATION}
}

# Tar a directory
function tarify()
{
    tar -zcvf $1.tar.gz $1
}

# Easy full path printer
alias ep="readlink -f $1"

# Use temp directory
alias tmp="cd `mktemp -d`"

# Alias for quick open/sourcing of bash session
alias bs='vi ~/.bash_session'
alias sbs='source ~/.bash_session'

# Alias for quick open of i3 config
alias i3c="vi ~/.config/regolith/i3/config"

# Alias for opening ubuntu_install.sh
alias ubi="vi ~/src/dotfiles/ubuntu_install.sh"

# Make temporary bash script
alias tb="touch test.sh; chmod +x test.sh; vi test.sh"

alias sb="source ~/.bashrc"
alias ob="vi ~/.bashrc"

# Vimrc
alias vimrc="vi ~/.config/nvim/init.vim"

function f()
{
    find . -name "$1" -print
}

# cd up to given folder or up three times
function cdu() {
    local EXPRESSION="$1"
    if [ -z "$EXPRESSION" ]; then
        cd ../../..
        return 0
    fi
    if [ "$EXPRESSION" = "/" ]; then
        cd "/"
        return 0
    fi
    local CURRENT_FOLDER="$(pwd)"
    local MATCHED_DIR=""
    local MATCHING=true

    while [ "$MATCHING" = true ]; do
        if [[ "$CURRENT_FOLDER" =~ "$EXPRESSION" ]]; then
            MATCHED_DIR="$CURRENT_FOLDER"
            CURRENT_FOLDER=$(dirname "$CURRENT_FOLDER")
        else
            MATCHING=false
        fi
    done
    if [ -n "$MATCHED_DIR" ]; then
        cd "$MATCHED_DIR"
        return 0
    else
        echo "No Match." >&2
        return 1
    fi
}

# complete cdu
_cdu () {
    # necessary locals for _init_completion
    local cur prev words cword
    _init_completion || return

    COMPREPLY+=( $( compgen -W "$( echo ${PWD//\// } )" -- $cur ) )
}
complete -F _cdu cdu

# If fzf is present, add v for quick vimming action
alias v="fzf --multi --bind 'enter:become(vim {+})'"

# f is using fzf and ripgrep for a live grep
f() {
    # 1. Search for text in files using Ripgrep
    # 2. Interactively restart Ripgrep with reload action
    # 3. Open the file in Vim
    IFS=: read -ra selected < <(
    rg --color=always --line-number --no-heading --smart-case "${*:-}" |
        fzf --ansi \
        --delimiter : \
        --preview 'bat --color=always {1} --highlight-line {2}' \
    )
    [ -n "${selected[0]}" ] && vim "${selected[0]}" "+${selected[1]}"
}

alias rg="rg --smart-case"
