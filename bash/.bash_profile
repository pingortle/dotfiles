export PATH="/usr/local/sbin:$HOME/bin:$PATH"

eval "$(nodenv init -)"
eval "$(rbenv init -)"

source /usr/local/etc/bash_completion.d/git-completion.bash
export PS1="./\W \$ "
