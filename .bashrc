# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#renew the ip of a certain network card
ipre(){
dhclient -r $1
ifdown $1
ifup $1
}

socket(){ netstat -na | grep :$1; }
go_partage(){
mount //"${1:-192.168.1.183}"/shared /mnt/shared/ -o username=username_here,password=password_here
}
go(){ [ -x "$1" ] || chmod +x "$1" ; "$1"; }
stop_service() { systemctl status "$1" >/dev/null 2>/dev/null && systemctl stop "$1" || echo "$1 n'est pas en cours..."; }
start_service() { systemctl status "$1" >/dev/null 2>/dev/null && echo "deja en cours" ||systemctl start "$1"; }
allusers() { awk -F: '{ print $1}' /etc/passwd; }
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias page="ls|less"alias page="ls|less"
alias emacs="emacs -nw"
alias getip="ifconfig|grep 'inet ' | awk '{print \$2}'"
alias ports_ouverts="netstat -plantu | grep -i listen"
alias heure="date "+%k_%M""
alias histl="history | less"
alias cls="clear"
#user variables




#option to not overwrite if i do . in term command
set -o noclobber
