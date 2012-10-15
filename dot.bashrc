# .bashrc

# User specific aliases and functions
shopt -s histappend

force_color_prompt=yes

env_file="/home/setup/dot.bashrc"
if [ -x $env_file ]; then
	source $env_file
fi

#export PATH=/sbin:/usr/sbin:$PATH:/usr/libexec/xscreensaver

unalias vi 2> /dev/null > /dev/null
alias vi='vim -v -C'
alias lc='ls -C --color=tty'
alias ll='ls -l --color=tty'
alias lr='ls -lrth --color=tty'
alias cvstatus='cvs status | grep -v Examining | grep Status: | grep -v Up-to-date'
alias v='vnchome && nohup vncvhome &'
alias backup='mount /media/JohnsHome && rdiff-backup --print-statistics -v6 /home/john/. /media/JohnsHome/j/john/. ; umount /media/JohnsHome'
alias view='vim -R'
alias mv='mv -i -v'

function pycalc() { python -c "from math import *; print $*" ;}
function calc(){ awk "BEGIN{ print $* }" ;}

alias ddpoker='(cd ~/.wine/drive_c/Program\ Files/ddpoker && wine ./poker.exe > /tmp/ddpoker.out 2> /tmp/ddpoker.err)'

alias mountjs152033='sudo mount -t nfs hampk-home1.sfbay:/global/export/home1/317/js152033 /home/js152033'


export COLUMNS
export EDITOR=vim
export COLORTERM=on

#export PAGER=~/bin/vimpager
#alias less=$PAGER
#alias zless=$PAGER

export PAGER=less
export LESS="-w -m --follow-name"
# export LESS=-r

# PROMPT_COMMAND defaults is "echo -ne
# "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"" export
# PROMPT_COMMAND='`if [ $?==0 ]; then PS1=":)[\u@\h][\d \@][\w] \$\r\n"; else
# PS1=":([\u@\h][\d \@][\w] \$\r\n"; fi`' bash prompt old PS1='[\u@\h \W]\$
# ' export PS1="[\u@\H][\d \@][\w] \$\r\n"
#export PS1='\`if [ \$?==0 ]; then echo -e "\033[01;32m:)"; else echo -e "\033[01;31m:("; fi\` \u@\h[\d \@][\w] \$\r\n'

export PS1="[\u@\H][\d \@][\w] \$\r\n"
PS1_SAVE=$PS1
NORMAL="\[\033[01;0m\]"
SCARY="\[\033[01;31m\]"
PROMPT_COMMAND='if [ $? == 0 ]; then PS1="$NORMAL:-) $PS1_SAVE"; else PS1="$SCARY:-( $PS1_SAVE$NORMAL"; fi'

alias blob='sudo modprobe cryptoloop && sudo modprobe serpent && sudo losetup -d /dev/loop0 && sudo losetup -e serpent /dev/loop0 /home/js152033/scribble/scribblesblob && sudo mount -t ext3 /dev/loop0 /home/js152033/scribble/scribbles && cd /home/js152033/scribble/scribbles'
alias unblob='cd ~ && sudo umount /home/js152033/scribble/scribbles;  sudo losetup -d /dev/loop0; sudo rmmod serpent; sudo rmmod cryptoloop'


#from http://pastebin.com/yhXfwcyF

## Using less but with color
lesslog() { ccze -A < $1 | less -R; }
## same as less but with tail
logtail() { tail -f $1 | ccze -A; }
## show the the 4 more consumming processes and display with color
pstail() { ps aux | sort -nk +4 | tail | ccze -A;  }
## untar a file while downloading
wtar() { wget -qO - $1 | tar xvvzf - | ccze -A;  }
## generate a random 8 char password with digit, letter and special char
genpass() { cat /dev/urandom|tr -dc a-zA-Z0-9-_$@#\?|fold -w 8|head -n1;  }
## Show a graph of number of connection by IP
netgraph() { netstat -anpet | grep ESTABLISHED | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | awk '{ printf("%s\t%s\t",$2,$1) ; for (i = 0; i < $1; i++) {printf("*")}; print "" }' | ccze -A;  }
## make a md5 of a string
forgemd5() { echo -n $1 | md5sum | cut -b -32;  }
## Letissnow fuck google and THX @climagic ;)
letitsnow() { clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|awk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}';  }
## show target url when it's shortened THX @fukr
unshorten() { curl -sIL $1|grep ^Location|tail -1|sed 's/Location: \(.*\)/\1/g'; }



# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
# (This is no longer needed from version 0.8 of the theme engine)
# export GTK2_RC_FILES=$HOME/.gtkrc-2.0
