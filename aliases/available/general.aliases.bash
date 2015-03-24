cite about-alias
about-alias 'general aliases'

# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

# Alias python with p
alias p="ipython"

# Source bashrc
alias ba="source ~/.bashrc"

alias _="sudo"

if [ $(uname) = "Linux" ]
then
  alias ls="ls --color=auto"
fi
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

alias q='exit'

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
alias	md='mkdir -p'
alias	rd='rmdir'

# Open programs like the mac
alias open="xdg-open"

# Always grep recursively all files 
alias grep='grep -r'

# ack = ack-grep 
alias ack='ack-grep'

# Cd and ls at the same time
function cs() {
    cd "$1"
    ls
}

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

# Make temporary bash script
alias tb="touch test.sh; chmod +x test.sh; vi test.sh"

alias sb="source ~/.bashrc"
