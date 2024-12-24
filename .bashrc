#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


PS1='[\u@\h \W]\$ '


TERM='xterm-256color'
EDITOR='nvim'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacman --color always'
alias docker='sudo docker'
alias tree='tree -C'
alias ip='ip -c'
alias v=$EDITOR
alias :q='exit'
alias cl='clear'
alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"


eval "$(fzf --bash)"
eval "$(starship init bash)"

echo "" && fastfetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"


# function to cd, open and edit files
e()
{
  if [[ $# -eq 1 && ( -d "$1" || "$1" == "-" ) ]]
  then
    builtin cd "$1" || return
    ls -bvxAF --color --group-directories-first

  elif test $# -eq 0
  then
    builtin cd "$HOME" || return

  elif test -f "$1" || test ! -e "$1" || test $# -gt 1
  then
    $EDITOR "$@"

  else
    printf "e: case not accounted for\n"

  fi
}
