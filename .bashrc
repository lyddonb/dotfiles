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

case "$TERM" in
    xterm-color) color_prompt=yes;;
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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

# on mac to install
# brew install bash-completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

DEFAULT_COLOR="[00;1m"
GRAY_COLOR="[37;1m"
PINK_COLOR="[35;1m"
GREEN_COLOR="[32;1m"
CYAN_COLOR="[36;1m"
ORANGE_COLOR="[33;1m"
RED_COLOR="[31;1m"
BLUE_COLOR="\[\033[0;34m\]"
PURPLE_COLOR="\[\033[0;35m\]"
LIGHT_GRAY_COLOR="\[\033[0;37m\]"
if [ `id -u` == '0' ]; then
    USER_COLOR=$RED_COLOR
else
    USER_COLOR=$ORANGE_COLOR
fi

function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="✔"
        fi
        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote="↑"
            else
                remote="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote="+"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote="✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi
        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

        echo "(${branch}${state}${remote})"
    fi
    return
}

export BASEPROMPT="\[\e${GREEN_COLOR}\]\w\[\e${CYAN_COLOR}\]\$(parse_git_branch)\[\e${DEFAULT_COLOR}\]"
export PS1="${BASEPROMPT} $ "

#export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

#export CLICOLOR=1
#if [ `uname` == "Darwin" ]; then
    #export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
    #export LC_CTYPE=en_US.utf-8
    #alias free=tfree
#else
    #alias ls='ls --color=auto'
#fi
#export IGNOREEOF=1
#export LESS=FRSX

export EDITOR=vim
export PYOPEN_CMD=vim
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$SVN_EDITOR

# download this.
# https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
if [ -e "$HOME/git-completion.bash" ]; then
    source "$HOME/git-completion.bash"
fi;
source ~/.git-completion.bash

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

source /usr/local/bin/virtualenvwrapper.sh
source ~/aliases

#todo.txt
source /usr/local/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion
export TODOTXT_DEFAULT_ACTION=ls
