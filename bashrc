# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
go_partage(){
mount //"${1:-192.168.1.183}"/shared /mnt/shared/ -o username=username_here,password=password_here
}
go(){ [ -x "$1" ] || chmod +x "$1" ; "$1"; }
stop_service() { systemctl status "$1" >/dev/null 2>/dev/null && systemctl stop "$1" || echo "$1 n'est pas en cours..."; }
start_service() { systemctl status "$1" >/dev/null 2>/dev/null && echo "deja en cours" ||systemctl start "$1"; }
alias mv='mv -i'
alias page="ls|less"alias page="ls|less"
alias emacs="emacs -nw"
alias get_ip="ifconfig|grep 'inet ' | awk '{print \$2}'"
alias ports_ouverts="netstat -plantu | grep -i listen"
alias heure="date "+%k_%M""

#user variables
set -o noclobber
