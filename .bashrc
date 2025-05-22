#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"
alias bat="bat --color always --style='numbers,grid,changes' --theme=Dracula"
alias ls='ls --color=auto -v --group-directories-first -1'
alias pacman='sudo pacman --color always'
alias pq='sudo pacman -Q --color never'
alias glog='git log --oneline --graph'
alias grep='grep --color=auto'
alias docker='sudo docker'
alias mkc='make clean'
alias v="./v || nvim"
alias gs='git status'
alias tree='tree -C'
alias ip='ip -c'
alias cl='clear'
alias :q='exit'
alias mk='make'


eval "$(fzf --bash)"
eval "$(starship init bash)"

# nvm
alias nvm='. ~/loadnvm.sh; nvm "$@"'
alias npm='. ~/loadnvm.sh; npm "$@"'
alias node='. ~/loadnvm.sh; node "$@"'

export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export LANG=en_US.UTF-8

echo "" && fastfetch
date
