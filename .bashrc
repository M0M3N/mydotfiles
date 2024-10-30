#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# My custom aliases
alias ls='ls --color=auto'
alias quit='exit'
alias grep='grep --color=auto'
alias tree='tree -C'
alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"
# alias zq='kill $(ps aux | grep "zellij$" | grep -Eo " {2,}[0-9]{1,} {2,}")'
alias ip='ip -c'
alias vi='nvim'
# alias vim='nvim'

PS1='[\u@\h \W]\$ '

# LD_LIBRARY_PATH=~/Qt/6.8.0/gcc_64/include/:$LD_LIBRARY_PATH

eval "$(starship init bash)"
eval "$(fzf --bash)"

#if [ -z "$ZELLIJ" ]; then
#	zellij
#fi
