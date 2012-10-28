# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

case "$TERM" in
    xterm-256color) color_prompt=yes;;
esac

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

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#source /usr/local/bin/virtualenvwrapper.sh
source ~/aliases

DEFAULT_COLOR="[00;1m"
GRAY_COLOR="[37;1m"
PINK_COLOR="[35;1m"
GREEN_COLOR="[32;1m"
CYAN_COLOR="[36;1m"
ORANGE_COLOR="[33;1m"
RED_COLOR="[31;1m"
if [ `id -u` == '0' ]; then
    USER_COLOR=$RED_COLOR
else
    USER_COLOR=$ORANGE_COLOR
fi

VCPROMPT_EXECUTABLE=~/programs/vcprompt/vcprompt
function vcprompt() {
    if [ -e "$VCPROMPT_EXECUTABLE" ]; then
        $VCPROMPT_EXECUTABLE -f $':\033[1;34m%n\033[00;1m:\033[0;37m%[unknown]b\033[32;1m%m%u'
    fi
}

function activevirtualenv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo -n $'\033[00;1m:\033[36;1m'
        echo -n "$(basename $VIRTUAL_ENV)"
    fi
}

#export ARCHFLAGS='-arch i386 -arch x86_64'
export BASEPROMPT='\[\e${GREEN_COLOR}\]\w\[\e${GRAY_COLOR}`vcprompt`\]\[\e${DEFAULT_COLOR}\]'

export PROMPT="${BASEPROMPT} $ "
export PS1=$PROMPT""

#export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

export EDITOR=vim
export PYOPEN_CMD=vim
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$SVN_EDITOR

# python
export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# download this.
# https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
if [ -e "$HOME/git-completion.bash" ]; then
    source "$HOME/git-completion.bash"
fi;

source /usr/local/etc/profile.d/z.sh
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$PATH
export PATH=~/bin:$PATH
source $HOME/aliases

# VirtualEnv
# 
# Setting up the VirtualEnv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true

# Python command line
export PYTHONSTARTUP=$HOME/.pythonstartup

source ~/.git-completion.bash
