#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

TERM='xterm-256color'

alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"
alias bat="bat --color always --style='numbers,grid,changes' --theme=Dracula"
alias ls='ls --color=auto -v --group-directories-first -1'
alias pacman='sudo pacman --color always'
alias grep='grep --color=auto'
alias docker='sudo docker'
alias mkc='make clean'
alias tree='tree -C'
alias ip='ip -c'
alias cl='clear'
alias :q='exit'
alias mk='make'
alias v='./v'


eval "$(fzf --bash)"
eval "$(starship init bash)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# . "$HOME/.cargo/env"

export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export LANG=en_US.UTF-8

echo "" && fastfetch
