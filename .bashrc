# shellcheck shell=bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If there is a default location, cd to it
defaultLocation='/tmp/defaultTerminalLocation'
if [ -s $defaultLocation ]; then
    if [ -d "$(cat $defaultLocation)" ]; then
        cd "$(cat $defaultLocation)" || return
    fi
fi

alias dtd="pwd > /tmp/defaultTerminalLocation"
g() {
    if [ -s "$defaultLocation" ]; then
        if [ -d "$(cat "$defaultLocation")" ]; then
            cd "$(cat /tmp/defaultTerminalLocation)" || return
        fi
    fi
}

# shellcheck disable=SC2025
if [ "$(whoami)" == 'root' ]; then
    PS1="\e[95m!\! \e[32m[\T] \e[91m$(whoami)\e[36m@\h \e[31m\w\e[39m\n# "
else
    PS1="\e[95m!\! \e[32m[\T] \e[36m$(whoami)@\h \e[31m\w\e[39m\n# "
fi

set -o vi
shopt -s cdspell

alias l="ls"
alias ls="ls -F"
alias ll="ls -lh"
alias la="ls -A"
alias lal="ls -Al"
lt() {
    # shellcheck disable=SC2012
    ls -t "$@" | head
}
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias c="clear"
alias j="jobs"
alias k="kill"
alias p8="ping 8.8.8.8"
alias t8="traceroute 8.8.8.8"
alias src="source ~/.bash_profile"
alias make="make -j 6"
alias pm="sudo pacman"
alias mnv="mvn -T 6"
alias ebrc="vi ~/.bashrc && source ~/.bashrc"
alias ei3="vi ~/.config/sway/config"
alias pdb="python3.13 -m pdb"
alias python="python3.13"
alias pip="pip3.13"
alias tree="tree -C"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias gs="git status"
alias gpush="git push"
alias gpul="git pull"
alias gpull="git pull"
alias gc="git commit"
alias ga="git add"
alias gb="git branch"
alias gbc="git branch --show-current"
alias gch="git checkout"
alias gl="git log --graph"
alias glo="git log --oneline --graph"
alias gla="git log --graph --all"
alias gloa="git log --oneline --graph --all"
alias glav="git log --graph --all"
alias gwatch='watch -n .5 -c "git log --oneline --all --graph --decorate=short --color=always"'
alias gsta="git stash"
alias sctl="sudo systemctl"
alias jctl="sudo journalctl"
alias ack="ag --pager='less -r'"
alias top="htop"
alias vi="nvim"
alias imasscan="sudo masscan --rate 8000 -p T:1-65535,U:1-65535"
alias inmap="nmap -sC -sV -oN nmap.out -T4"

if command -v pbcopy &>/dev/null; then
    alias clip="pbcopy"
    alias paste="pbpaste"
elif command -v xclip &>/dev/null; then
    alias clip="xclip -i -selection clipboard"
    alias paste="xclip -o -selection clipboard"
fi

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
alias env="env; printf '\e[0m'"

export EDITOR='nvim'

if command -v nvim &>/dev/null; then
    export GIT_EDITOR=nvim
fi

if [[ -d "$HOME/.bash_init_scripts" ]]; then
    for f in ~/.bash_init_scripts/*; do
        # shellcheck disable=SC1090
        source "$f"
    done
fi

if [[ -f "$HOME/.cargo/env" ]]; then
    # shellcheck disable=SC1091
    . "$HOME/.cargo/env"
fi

# Created by `pipx` on 2024-07-10 05:22:21
export PATH="$PATH:/Users/Skyler/.local/bin"
