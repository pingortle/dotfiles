export GEM_HOME=$HOME/.gem
export PATH="/usr/local/sbin:$HOME/.bin:$GEM_HOME/bin:$HOME/.binstubs:$PATH"
export TERM=xterm-256color-italic
export CLICOLOR=1
export EDITOR=vim

eval "$(nodenv init -)"
eval "$(rbenv init -)"

source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh
[ -f $HOME/.creds ] && source $HOME/.creds

export BOLD_ON="\[\e[1m\]"
export BOLD_OFF="\[\e[22m\]"
export INVERSE_ON="\[\e[7m\]"
export INVERSE_OFF="\[\e[27m\]"
export ITALICS_ON="\[\e[3m\]"
export ITALICS_OFF="\[\e[23m\]"
export STRIKETHROUGH_ON="\[\e[9m\]"
export STRIKETHROUGH_OFF="\[\e[29m\]"
export UNDERLINE_ON="\[\e[4m\]"
export UNDERLINE_OFF="\[\e[24m\]"

export FG_BLACK="\[\e[30m\]"
export FG_BLUE="\[\e[34m\]"
export FG_CYAN="\[\e[36m\]"
export FG_DEFAULT="\[\e[39m\]"
export FG_GREEN="\[\e[32m\]"
export FG_MAGENTA="\[\e[35m\]"
export FG_RED="\[\e[31m\]"
export FG_YELLOW="\[\e[33m\]"
export FG_WHITE="\[\e[37m\]"
export FG_GRAY="\[\e[90m\]"

export BG_BLACK="\[\e[40m\]"
export BG_BLUE="\[\e[44m\]"
export BG_CYAN="\[\e[46m\]"
export BG_DEFAULT="\[\e[49m\]"
export BG_GREEN="\[\e[42m\]"
export BG_MAGENTA="\]\e[45m\]"
export BG_RED="\[\e[41m\]"
export BG_YELLOW="\[\e[43m\]"
export BG_WHITE="\[\e[47m\]"

export COLOR_RESET="\[\e[0m\]" # reset; clears all colors and styles (to white on black)

function git_prompt {
  type __git_ps1 &>/dev/null && __git_ps1 "⎇  %s"
}

export PS1="$COLOR_RESET[$FG_GRAY\w$COLOR_RESET]\
[$FG_GRAY$(printf '$(git_prompt)')$COLOR_RESET]\n\
$FG_BLUE\u$BOLD_ON$FG_GRAY\$$BOLD_OFF $COLOR_RESET"
export SCREENCAST_PS1="$COLOR_RESET[$FG_GRAY\W$COLOR_RESET]\n$FG_GREEN\u$BOLD_ON$FG_GRAY\$$BOLD_OFF $COLOR_RESET"

export GIT_USER=pingortle
export DEV="$HOME/dev"
export MYDEV="$DEV/$GIT_USER"
export DOTFILES="$MYDEV/dotfiles"

alias diff="git diff --no-index"
alias rebash="source ~/.bash_profile"
alias screencast='PS1="$SCREENCAST_PS1"'
alias v=vim
alias vs='vim -S .git/$(git rev-parse --abbrev-ref HEAD | tr -d "\n").vim'
alias mvims='mvim -S .git/$(git rev-parse --abbrev-ref HEAD | tr -d "\n").vim'
alias til="vim \"$MYDEV/til\" +'cd %:p:h' +TIL"
alias tpbc='tmux saveb - | pbcopy'
alias tmux-here='tmux new -s "$(basename $(pwd))" -c $(pwd)'
alias ssh='TERM=xterm-256color ssh'
alias toggle-dark="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
alias browse-node-docs="open https://nodejs.org/dist/latest/docs/api/"
alias mdlive="npx --quiet markdown-live"
alias whatsmyip="curl https://api.ipify.org"

alias la="ls -a"
alias be="bundle exec"

function vrg {
  vim +"Rg $@"
}

function prg {
  rg -p $@ | less -RMFXK
}

function dev {
  local user=${2:+$1}
  local repo=${2:-$1}

  printf "$HOME/dev/$user/$repo"
}

function my {
  printf $(dev $GIT_USER $1)
}

function cdev {
  cd $(dev $@)
}

function cmy {
  cd $(my $@)
}
