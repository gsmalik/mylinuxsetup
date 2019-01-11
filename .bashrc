# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\W: '
#	PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\W\]: '
PS1='${debian_chroot:+($debian_chroot)}\W: '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #PS1='\e[0;32m\W:\e[m'
	#PS1='${debian_chroot:+($debian_chroot)}\W: '
	#PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\W\]: '
	PS1='${debian_chroot:+($debian_chroot)}\W: '

    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias pushtolab='rsync -hvrPute ssh /mnt/main/ gsmalik@129.97.68.28:/mnt/main/;rsync -hvrPute ssh ~/.bashrc gsmalik@129.97.68.28:~/.bashrc;rsync -hvrPute ssh ~/.vimrc gsmalik@129.97.68.28:~/.vimrc;rsync -hvrPute ssh ~/.vim/ gsmalik@129.97.68.28:~/.vim/'
alias pushtolabbwlimit='rsync --bwlimit=2048 -hvrPute ssh /mnt/main/ gsmalik@129.97.68.28:/mnt/main/;rsync --bwlimit=2048 -hvrPute ssh ~/.bashrc gsmalik@129.97.68.28:~/.bashrc;rsync --bwlimit=2048 -hvrPute ssh ~/.vimrc gsmalik@129.97.68.28:~/.vimrc;rsync --bwlimit=2048 -hvrPute ssh ~/.vim/ gsmalik@129.97.68.28:~/.vim/'

alias pullfromlab='rsync -hvrPute ssh gsmalik@129.97.68.28:/mnt/main/ /mnt/main/;rsync -hvrPute ssh gsmalik@129.97.68.28:~/.bashrc ~/.bashrc;rsync -hvrPute ssh gsmalik@129.97.68.28:~/.vimrc ~/.vimrc;rsync -hvrPute ssh gsmalik@129.97.68.28:~/.vim/ ~/.vim/'
alias pullfromlabbwlimit='rsync --bwlimit=2048 -hvrPute ssh gsmalik@129.97.68.28:/mnt/main/ /mnt/main/;rsync --bwlimit=2048 -hvrPute ssh gsmalik@129.97.68.28:~/.bashrc ~/.bashrc;rsync --bwlimit=2048 -hvrPute ssh gsmalik@129.97.68.28:~/.vimrc ~/.vimrc;rsync --bwlimit=2048 -hvrPute ssh gsmalik@129.97.68.28:~/.vim/ ~/.vim/'

alias syncwithlab='pullfromlab; pushtolab'
alias syncwithlabbwlimit='pullfromlabbwlimit; pushtolabbwlimit'
alias syncwithlabandpoweroff='pullfromlab; pushtolab;poweroff'
alias eduroam_connect='sudo rm -rf /var/run/wpa_supplicant/wlx00e04c13211e; sudo wpa_supplicant -i wlx00e04c13211e -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf &'
alias vivado='xhost +; sudo /mnt/main/software/installation/xilinx/Vivado/2017.2/bin/vivado'

alias dir_academic='cd /mnt/main/academics'
alias open='gnome-open'
alias matlab='/mnt/main/RESEARCH/SOFTWARE/INSTALLATION/MATLAB/bin/matlab &'
alias connectjane='ssh gsmalik@jane.uwaterloo.ca'
alias connecthex='ssh gsmalik@hex.uwaterloo.ca'
alias connectagamemnon='ssh gsmalik@agamemnon.eng.uwaterloo.ca'
alias connectdeathstar='ssh gsmalik@deathstar.eng.uwaterloo.ca'
alias work='cd ${HOME}/work'

function switch_xlnx ()
{
	git config --global user.email malik@xilinx.com
	git config --global user.name malik
}

function switch_prsnl ()
{
	git config --global user.email gsmalik@uwaterloo.ca
	git config --global user.name gsmalik
}




function updatemylinuxsetup ()
{
	pushd ${HOME}
	rm -rf mylinuxsetup 
	git clone git@github.com:gsmalik/mylinuxsetup.git
	cp -rf ${HOME}/.vim mylinuxsetup/
	cp -rf ${HOME}/.vimrc ylinuxsetup/
	cp -rf ${HOME}/.bashrc mylinuxsetup/
	cd mylinuxsetup
	git add -A
	git commit -m "another update"
	git push -u origin master
	popd
}


function setup_xcaffe
{
    source /home/gsmalik/work/FINN/env.sh
    export SIM_ROOT=`pwd`
    export RPNN_LIBRARY=`pwd`/../../../hls

}
