#!/bin/zsh

#add '~/.local/bin' to path
export PATH="$HOME/.local/bin:$PATH"

#defualt apps
export BROWSER="librewolf"
export EDITOR="nvim"
export TERM="kitty"
export VISUAL="less"
export SUDO_EDITOR="nvim"

#common files
export zc="$HOME/.zshrc"

#start X because im lazy
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
