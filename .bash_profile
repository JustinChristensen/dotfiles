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
#   pppath() {
#       echo "${PATH//:/$'\n'}"
#   }

commits_by_year() {
    git log --format="%ai" "$1" | cut -d- -f1 | uniq -c
}

report_disk_usage() {
    sudo du -ch / | sort -h > usage.txt
    tail -30 usage.txt
}

networks() { 
    local APS=$(airport -s) && \
    local HEAD=$(echo "$APS" | head -1) && \
    local REST=$(echo "$APS" | tail +2) && \
    echo "$HEAD" && echo "$REST" | sort -k1.52nr,1.54; 
}

trace_temps() { 
    sudo powermetrics --samplers smc "$@" | fgrep --line-buffered 'die temperature' | (
        while IFS=' ' read -r DEVICE _ _ TEMP UNIT; do 
            date "+%Y-%m-%dT%H:%M:%SZ $DEVICE $TEMP $UNIT" 
        done
    )
}

gen_asm() {
# Makefile
    cat <<'EOF' > Makefile
S_PROG := a.out

AS := as
AS_FLAGS := -g -Wall -Wextra -static

LD := ld
LD_FLAGS := -dead_strip -static

$(S_PROG): main.s
	$(AS) $(AS_FLAGS) -o $@.o $^
	$(LD) $(LD_FLAGS) -o $@ $@.o 
	dsymutil $@

.PHONY: clean
clean:
	rm -rf *.o *.dSYM $(S_PROG) 
EOF

# main.s
    cat <<'EOF' > main.s
.p2align 4

L_SYS_EXIT = 0x2000001
L_SUCCESS = 0

.global exit
exit:
    mov $L_SYS_EXIT, %eax
    mov $L_SUCCESS, %edi
    syscall
    ret

.global start
start:
    call exit
EOF
}

gen_editorconfig() {
    cat <<'EOF' > .editorconfig
root = true

[*]
indent_style = space
indent_size = 4
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false

[*.yml]
indent_size = 2

[Makefile]
indent_style = tab

[*.mk]
indent_style = tab
EOF
}

rx_to_rx() {
    echo "obase=$2; ibase=$1; $3" | bc
}

motd() {
    local file=$(find -L ~/.motd -type f | sort -R | head -1)
    [[ -n "$file" ]] && cat "$file"
}

motd

ubuntu() {
    docker run --rm -it -v "$(pwd):/home/wroathe/pwd" "$@" ubuntu-dev 
}

rohan() {
    local QEMU=${QEMU:-'qemu-system-x86_64'}
    local CPUS=${CPUS:-2}
    local MEM=${MEM:-2G}
    local IMAGE=${IMAGE:-"$HOME/vms/ubuntu.img"}
    local BOOT_CD=${BOOT_CD:-}

    if [ -n "$BOOT_CD" ]; then
        BOOT_CD="-boot once=d -cdrom $BOOT_CD"
    fi

    "$QEMU" \
        -nographic \
        -accel hvf -cpu host \
        -smp "$CPUS" -m "$MEM" \
        -nic user,model=virtio,hostfwd=tcp::5555-:22 \
        -drive file="$IMAGE",format=raw \
        $BOOT_CD $@
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
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:/Applications/Sublime Text.app/Contents/SharedSupport/bin"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/Applications/MAMP/bin/php/php7.2.1/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"
# export PATH="$HOME/Applications/GIMP.app/Contents/MacOS:$PATH"

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export DYLD_LIBRARY_PATH=~/lib
export PYTHONPATH="$(lldb -P)"
export INCL_C='/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include'

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
if [ -e /Users/wroathe/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/wroathe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

alias syslog_errors="log stream --style compact --predicate 'messageType == error || messageType == fault'"

# Which GHC RTS options are available
# ghc +RTS -?

# find who's being naughty
# :verbose set expandtab?

# tty for hyperkit vms
# screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export PATH="/usr/local/opt/flex/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"

# ommitting things from package installs on systems that use dpkg!!!!
# cat /etc/dpkg/dpkg.cfg.d/excludes
# 
# # Drop all man pages
# path-exclude=/usr/share/man/*
# 
# # Drop all translations
# path-exclude=/usr/share/locale/*/LC_MESSAGES/*.mo
# 
# # Drop all documentation ...
# path-exclude=/usr/share/doc/*
# 
# # ... except copyright files ...
# path-include=/usr/share/doc/*/copyright
# 
# # ... and Debian changelogs
# path-include=/usr/share/doc/*/changelog.Debian.*

# repeat program in gdb
# set pagination off
# break exit
# commands
# run
# end

# Malloc tracing OSX
# echo 'wwwafoo.com' | MallocHelp=1 ./auto nfa -r 'www.foo\.com'

# print firmware variables in nvram
# sudo nvram -p

# error logging for OSX
# log show --predicate '(messageType == "error") || (messageType == "fault")' --last=23m

# scan access points
# airport -s

export PATH="/usr/local/opt/e2fsprogs/bin:$PATH"
export PATH="/usr/local/opt/e2fsprogs/sbin:$PATH"

# file bytes in decimal
# od -An -vtu1 foo.txt

# TODO: find object with defined symbol
# e.g. 
# findsym _exit /usr/lib       
# => /usr/lib/system/libfoo.dylib   0xefae000a _TEXT _exit
# => /usr/lib/system/libbar.dylib   0xefaeeeea _TEXT _exit

# codesign binary with hypervisor entitlement 
# codesign --entitlements entitlement.xml -fs qemu-cert $(which qemu-system-x86_64)

