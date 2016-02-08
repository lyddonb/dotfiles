#!/bin/bash

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
    detached_branch_pattern="# Not currently on any branch"
    remote_pattern="Your branch is (.*) of"
    diverge_pattern=" Your branch and (.*) have diverged"
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
