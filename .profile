#add '~/.local/bin' to path
export PATH="$HOME/.local/bin:$PATH"

# export TERM="xterm"

#defualt apps
export BROWSER="librewolf"
export EDITOR=nvim
export TERMINAL="kitty"
export VISUAL="bat"
export SUDO_EDITOR="nvim"

#common files
export zc="$HOME/.zshrc"

# fix for openal using pipewire as the defualt sound driver and alsa as a fallback
export ALSOFT_DRIVERS=pipewire,alsa

#start X because im lazy
[ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && exec startx
