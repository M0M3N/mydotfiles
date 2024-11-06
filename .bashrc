#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '


alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color always'
alias tree='tree -C'
alias ip='ip -c'
alias vi='nvim'
alias ff="fzf -m --preview='bat --color always --style='numbers,grid,changes' --theme=Dracula {}' --preview-label=' preview ' --border=rounded --wrap"


eval "$(fzf --bash)"
eval "$(starship init bash)"
