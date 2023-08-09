# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

if [[ -n "$SSH_CLIENT" ]]; then
    PS1="%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%~%F{red}]%F{red}ssh:%f "
else
    PS1="%F{red}[%F{yellow}%n%F{green}@%F{blue}%M %F{magenta}%~%F{red}]%f$ "
fi

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
stty -ixon
setopt extended_glob
setopt interactive_comments

# History settings
HISTFILE=~/.zhistory
SAVEHIST=100000
HISTSIZE=100000
setopt histignorealldups

# Load aliases if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
[ -f "$HOME/.shortcutrc" ] && source "$HOME/.shortcutrc"

# LS_COLOR config
LS_COLORS="di=1;4;33:fi=37:ex=4;31:*.jpg=32:*.jpeg=32:*.png=32:*.webp=32:*.mp3=36:*.mp4=36:*.webm=36:*.mkv=36:*.gif=32:*.py=4;32:*.c=4;32:*.sh=4;32:*.txt=4;37:*.torrent=34;46"
export LS_COLORS

# functions
gb() {
    if [ "$#" -ne 1 ]; then
        echo "needs 1 arg eg: gb 1"
        return 1
    fi

    local back=""
    for ((i = 0; i < $1; i++)); do
        back+="../"
    done
    cd "$back"
}

rbg() {
    $* > /dev/null 2>&1 &
}

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
