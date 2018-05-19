####################################################################
# Author: Justin Christensen
#
# 1. Include
# 2. Functions
# 3. Environment Setup
# 4. Shell Options 
# 5. Aliases
# 6. Notes
####################################################################

####################################################################
# 1. Include
####################################################################

. "$HOME/Google Drive/dotfiles/.bash_profile_keys"

bash_completion='/usr/local/share/bash-completion/bash_completion'
git_completion='/usr/local/etc/bash_completion.d/git-completion.bash'
git_prompt='/usr/local/etc/bash_completion.d/git-prompt.sh'

[[ -f $bash_completion ]] && . $bash_completion
[[ -f $git_completion ]] && . $git_completion
[[ -f $git_prompt ]] && . $git_prompt

####################################################################
# 2. Functions
####################################################################

# pretty print PATH
pppath() {
    echo "${PATH//:/$'\n'}"
}

####################################################################
# 3. Environment Setup
####################################################################

export PS1="\[\e[1m\][\u@\h:\W]\[\e[0m\]\$(__git_ps1 2> /dev/null) \[\e[1m\]$ \[\e[0m\]"
export HISTSIZE=500000
export CLICOLOR=1
export EDITOR=vim
export MYSQL_PS1="mysql (\u@\h) [\d] $ "
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export STOW_DIR="$HOME/dotfiles"
export GOPATH="$HOME/Development/go"
export PATH="$HOME/bin:$PATH"
# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/libexec"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
export PATH="$HOME/Library/Haskell/bin:$PATH"

# modifies PATH
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

####################################################################
# 4. Shell Options
####################################################################

shopt -s globstar
set -o vi

####################################################################
# 5. Aliases
####################################################################

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

####################################################################
# 6. Notes
####################################################################

# Using the remote debugger for chrome devtools
# 1. /Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222
# 2. curl -I localhost:9222

# Show #include <...> paths for clang
# echo | clang -v -E -x c++ -

# Install macvim with appropriate env
# brew install macvim --with-lua --custom-icons --with-luajit --cc=clang --override-system-vim --env=std

# Hold and repeat motion in Vintageous
# defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
#
# pmset

# Disable annoying finder animations:
# defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# showing and hiding Mission Control, command+numbers
# defaults write com.apple.dock expose-animation-duration -int 0; killall Dock

# Print environment for process
#  ps -p 3981 -wwwE

# CPU Cache information on Linux machines
# grep . /sys/devices/system/cpu/cpu0/cache/index*/*

# create a new x509 (cert) for our self-signed root CA
# openssl req -x509 -new -nodes -key rootCA.key -days 365 -out rootCA.crt

# create a certificate signing request (csr) for host with a new 2048-bit rsa key
# openssl req -nodes -newkey rsa:2048 -keyout host.key -out host.csr

# sign a certificate request
# openssl x509 -req -in host.csr -CA rootCA.pem -CAcreateserial -out host.crt -days 365

# create a pem file after signing the request
# cat host.key host.crt > host.pem

# start a test server requiring client authentication
# openssl s_server -Verify 2 -accept 4443 -cert host.pem

# connect to the test server
# openssl s_client -connect localhost:4443

# get WHOIS information about a specific IP address from ARIN
# whois -a 68.85.167.25

# allow binding to port 80 on localhost for all users without escalating privileges in windows
# netsh http add urlacl url=http://localhost:80/ user=everyone 

# add a route to the routing table in windows (requires admin)
# route /?
# route -4 -p ADD 192.168.56.0 MASK 255.255.255.0 192.168.57.1 METRIC 3 IF 4

# better osx dns resolution
# dscacheutil -q host -a name foo.medtronic.devl

# create a tilde-like shortcut on windows
# doskey cdhome=cd /d "%HOMEDRIVE%%HOMEPATH%"

# scan all ports 
# sudo nmap -p- 127.0.0.1

# RabbitMQ tracing
# rabbitmqctl trace_on
# rabbitmq-plugins enable rabbitmq_tracing
# rabbitmqctl trace_off

# RabbitMQ visualizer?
# rabbitmq-plugins enable rabbitmq_management_visualiser 

# RabbitMQ add user
# abbitmqctl add_user admin admin
# rabbitmqctl set_user_tags admin administrator

# Connect to LocalDB on Windows
# sqlcmd -S "(localdb)\MSSQLLocalDB"
# https://technet.microsoft.com/en-us/library/ms189826(v=sql.90).aspx

# List LocalDB databases
# sqlcmd -S "(localdb)\MSSQLLocalDB" -Q "SELECT NAME FROM master.dbo.sysdatabases" 

# Visual Studio connect to LocalDB database
# Server explorer > Data Connections

# list sql express database servers
# sqlcmd -L

# trust a network share on windows
# caspol -m -ag 1.2 -url file://\\vboxsrv\chrisj27/* FullTrust 

# nginx -s reload

# windows server perf
# Get-Counter | Export-Counter

# rabbitmqadmin --username=admin --password=admin -f tsv -q list queues name | while read -r name; do rabbitmqadmin --username=admin --password=admin delete queue name="${name}"; done 
# eval "$(chef shell-init bash)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
