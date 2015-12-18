platform="unknown"
unamestr=`uname`

if [[ "$unamestr" == "Linux" ]]; then
	platform="linux"
elif [[ "$unamestr" == "Darwin" ]]; then
	platform="mac"
fi

# If not running interactively, don't do anything
if [[ $platform == "mac" ]]; then
	[ -z "$PS1" ] && return
elif [[ $platform == "linux" ]]; then
	[[ $- != *i* ]] && return
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if [[ $platform == "mac" ]]; then
	#source /usr/local/etc/profile.d/z.sh
	#source /usr/local/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion
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
            branch_pattern="^On branch ([^${IFS}]*)"
            detached_branch_pattern="Not currently on any branch"
            remote_pattern="Your branch is (.*) of"
            diverge_pattern="Your branch and (.*) have diverged"
            untracked_pattern="Untracked files:"
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

            git=""
            if [ $branch ]; then
                git=${branch}
            fi

            if [ $state ]; then
                git=${git}" "${state}
            fi

            if [ $remote ]; then
                git=${git}" "${remote}
            fi

            echo ":${git}"
	    fi
	    return
	}
	export BASEPROMPT="\[\e${GREEN_COLOR}\]\w\[\e${CYAN_COLOR}\]""\$(parse_git_branch)""\[\e${DEFAULT_COLOR}\]"
	export PS1="${BASEPROMPT} $ "

fi

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

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
#source /usr/local/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion
#export TODOTXT_DEFAULT_ACTION=ls

# RVM
#source /Users/beaulyddon/.rvm/scripts/rvm

#source /usr/local/etc/profile.d/z.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/bin:$PATH
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH=$PATH:$HOME/programs/gcutil-1.8.2

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH:$GOPATH/bin
# Java 6
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/
# Java 8
export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/
#export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source $HOME/aliases

export ANT_OPTS="-Xms512m -Xmx1024m"
export MAVEN_OPTS="-Xmx4096m -Xss1024m -XX:MaxPermSize=128m"

export DOCKER_CERT_PATH=/Users/beaulyddon/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

#source /Users/beaulyddon/.nix-profile/etc/profile.d/nix.sh

# Clojure
LEIN_FAST_TRAMPOLINE=y
export LEIN_FAST_TRAMPOLINE
alias cljsbuild="lein trampoline cljsbuild $@"
