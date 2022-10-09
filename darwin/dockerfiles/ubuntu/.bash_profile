[ -f /etc/bash_completion ] && . /etc/bash_completion

export HISTSIZE=500000
export CLICOLOR=1
export EDITOR=vim
export PS1="\[\e[1m\][\u@ubuntu:\W]\[\e[0m\]\$(__git_ps1 2> /dev/null) \[\e[1m\]$ \[\e[0m\]"
shopt -s globstar
set -o vi
export LD_LIBRARY_PATH=~/lib
export PATH="$PATH:/opt/ghc/bin"
