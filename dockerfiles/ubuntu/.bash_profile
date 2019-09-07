[ -f /etc/bash_completion ] && . /etc/bash_completion

export HISTSIZE=500000
export CLICOLOR=1
export EDITOR=vim
export PS1="\[\e[1m\][\u@\h:\W]\[\e[0m\]\$(__git_ps1 2> /dev/null) \[\e[1m\]$ \[\e[0m\]"
shopt -s globstar
set -o vi
