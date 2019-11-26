cite about-plugin
about-plugin 'load fzf, if you are using it'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
