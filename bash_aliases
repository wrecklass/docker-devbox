#!/bin/bash

# Detect which `ls` flavor is in use

[[ -z "${CYG_HOME_ALIASES}" ]] && CYG_HOME_ALIASES="1" || return 0
# echo ".bash_aliases"

if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias sal='source ~/.bash_aliases'
alias b64="build64"
alias cls=clear
alias comcast='ftp upload.comcast.net'

alias dl="cd ~/Downloads"
alias dfh='df -h '
alias duh='du -sh'
alias dus='du -sh . | sort -h'
alias dust='du -sh * | sort -h'

alias fild='file'
alias fiel='file'

alias g="git"
alias get='git'
alias gc=". $HOME/bin/gitdate && git commit -v "

alias grep='grep -a --color=always'
alias gpre='grep -a --color=always'
alias grpe='grep -a --color=always'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# alias gvim='/c/WINDOWS/gvim.bat'

# vhosts
alias hosts='sudo vim /etc/hosts'

alias hp='hashapass.sh'
# alias h="history"

alias irb='irb --readline -r irb/completion'

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"

if ipconfig > /dev/null 2>&1; then # Windows ipconfig
  alias localip="ipconfig | grep IPv4 | awk -F':' '{print \$2}'"
else # *ix ifconfig
  alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
  alias ips="sudo ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
fi

alias j='jobs'
alias dot='ls -dAF ${colorflag} .*'
alias l.='ls -dAF ${colorflag} .*'
alias ll.='ls -ldF ${colorflag} .*'
alias l=less
alias lesb='$(history -p !!) | less'
alias ls='ls -F ${colorflag}'
alias lsp='\ls -F'
alias la='ls -AF ${colorflag}'
alias ll='ls -lF ${colorflag}'
alias lla='ls -alF ${colorflag}'
alias lh='ls -lhF ${colorflag}'
alias llh='ls -lhF ${colorflag}'
alias lt='ls -lrtF ${colorflag}'
alias llt='ls -lrtF ${colorflag}'
alias lltg='ls -lrtF ${colorflag}'
alias llgt='ls -lrtF ${colorflag}'
alias lg='ls -lF ${colorflag}'
alias llg='ls -lF ${colorflag}'

alias md='mkdir'
alias mdp='mkdir -p'
alias mypid='kindlepid.py B001BFB781653202'
alias mplayer='mplayer'
#alias mysql='start mysql'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

alias nslookupo=nslookup

alias pp='ping google.com'
alias r='fc -s'
alias ri='ri -f bs '
alias rit='ri -T -f bs '
alias rm='rm -i'
alias mr='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vm='mv -i'

alias s7='secure7'
alias sb='cd /usr/local/streambaby ; ./streambaby_high &> ~/.log/streambaby.log &'
alias scc='less $HOME/bin/screencheat'
alias sec='vi $HOME/bin/.secret'
alias sec2='ssh -i ~/.ssh/EngProdKey.pem -l ec2-user'
# alias sensu='ssh -i ~/.ssh/EngProdKey.pem -l ec2-user sensu'
alias sw='telnet  towel.blinkenlights.nl'
alias sx='startxwin.sh > .xwin_errors 2>&1'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias untar='tar xvf'
alias tg='tivoget.rb'
alias tivo='remote.pyw 192.168.1.20 &'
alias tivol='remote.pyw --landscape 192.168.1.20 &'
alias tivokeys="clear;cat $HOME/bin/keys"
alias todo='~/bin/todo.sh'
alias t='~/bin/todo.sh'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

alias vi="$EDITOR"
alias vim="$EDITOR"
alias vib='$EDITOR ~/.bashrc'
# Because I'm occasionally dislexic:
alias iv="$EDITOR"

alias httpd.py='python -m SimpleHTTPServer'
alias httpd.rb='ruby -run -e httpd . -p 8000'

alias xh='xhost +'
alias x='chmod +x '

# alias rout='route add 172.0.0.0 mask 255.0.0.0 '

