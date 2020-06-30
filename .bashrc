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
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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


export PROMPT_DIRTRIM=2
#truncates prompt with abbrs
#PROMPT_COMMAND='PS1X=$(p="${PWD#${HOME}}"; [ "${PWD}" != "${p}" ] && printf "~";IFS=/; for q in ${p:1}; do printf /${q:0:1}; done; printf "${q:1}")'

#prompt colorizers -- fubar, screws with gnu readline
#PS1='\e[33;33m\][\u@\h]\e[2;49;37m\] ${PS1X} \e[33;33m\]$\e[0;37m\] '
#PS1='\e[33;33m[\u@\h]\e[2;49;37m ${PS1X} \e[33;33m$\e[0;37m '
#PS1='\e[38;5;208m[\u@\h]\e[2;49;37m ${PS1X} \e[38;5;208m$\e[0;37m '


alias pip='pip3'
alias py='python3'

alias vi='vim'
alias vibashrc='vim ~/.bashrc'
alias vivi='vim ~/.vimrc'
alias sourcebashrc='source ~/.bashrc'

alias cls='clear && ls'
alias open='xdg-open'
alias apt='apt-get'

alias rmd='rm -rvf'

alias ld="ls -l | grep '^d'"
alias lf="ls -l | grep -v '^d'"
alias lt='ls -lt'
alias ltr='ls -ltr'

alias home='cd ~'
alias cda='cd ..'
alias cdb='cd ../..'
alias cdc='cd ../../..'
alias cdd='cd ../../../..'

alias god='cd ~/Downloads'
alias gop='cd ~/Insync/fburdelliv@gmail.com/Google\ Drive/personal'
alias gopn='cd ~/Insync/fburdelliv@gmail.com/Google\ Drive/personal/notes'
alias gopp='cd ~/Insync/fburdelliv@gmail.com/Google\ Drive/personal/projects'

alias gohf='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank'
alias gohs='cd ~/Insync/frank@pahdcc.com/Google\ Drive/2020\ Cycle'
alias gohm='cd ~/Insync/frank@pahdcc.com/Google\ Drive/2020\ Cycle/HDCC\ Campaign\ Matierals'
alias gohp='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/program'
alias gohn='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/notes'
alias gohd='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/program/data'
alias gohe='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/program/data/projects/env'
alias goha='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/program/admin'
alias gohsp='cd ~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/specialProjects'

alias path_hd='~/Insync/frank@pahdcc.com/Google\ Drive/frank/hdcc_frank/program/data'

alias purl="python3 '/home/frank/Insync/fburdelliv@gmail.com/Google Drive/personal/projects/pyba/core.py' go-url"

alias fsql='psql -U frank'

alias vicron='sudo crontab -e'

alias cronlog='grep CRON /var/log/syslog'


#enables tab titling
function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

