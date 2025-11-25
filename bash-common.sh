#!/usr/bin/env bash
# bash-common.sh – godmarck's power-metal edition
# https://github.com/godmarck/bash

# Load local settings if present (this file is never in git)
[ -f "$HOME/.settings" ] && source "$HOME/.settings"

# Eternal history (your original)
export HISTFILESIZE= HISTSIZE= HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

shopt -s checkwinsize cdspell direxpand dirspell

# Colours
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

alias ls='ls --color=auto -h' ll='ls -alF' la='ls -A' l='ls -CF'
alias grep='grep --color=auto'

# Handy
alias ..='cd ..' ...='cd ../..' ....='cd ../../..'
alias df='df -h' free='free -h'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Proxmox / LXC shortcuts – uses value from ~/.settings
alias ha='ssh $PROXMOX "pct enter 101"'
alias jelly='ssh $PROXMOX "pct enter 102"'
alias music='ssh $PROXMOX "pct enter 103"'
alias immich='ssh $PROXMOX "pct enter 104"'
alias pihole='ssh $PROXMOX "pct enter 105"'
alias romm='ssh $PROXMOX "pct enter 106"'
alias gv='ssh $PROXMOX "pct enter 107"'
alias stack='ssh $PROXMOX "pct list"'

# Location goodies – uses LOCATION from ~/.settings
alias weather='curl -s "wttr.in/$LOCATION?0"'
alias moon='curl -s wttr.in/Moon'

# Retro & Android
alias deck-sync='rsync -avz --delete ~/roms/ deck:~/roms/'

# NVIDIA
alias gpu='nvidia-smi' gpu-watch='watch -n 1 nvidia-smi'

# Starship + Neofetch
eval "$(starship init bash)"
command -v neofetch >/dev/null && neofetch

# Bash completion
if ! shopt -oq posix; then
    [[ -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
fi

echo -e "\033[0;32mDotfiles loaded – LOCATION=$LOCATION | PROXMOX=$PROXMOX 🤘\033[0m"
