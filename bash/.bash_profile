export PATH="/usr/local/sbin:$HOME/bin:$PATH"

eval "$(nodenv init -)"
eval "$(rbenv init -)"

source /usr/local/etc/bash_completion.d/git-completion.bash
export PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]$ \[\033[0m\]"

alias diff="git diff --no-index"
alias rebash="source ~/.bash_profile"
