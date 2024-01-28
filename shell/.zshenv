export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export ZDOTDIR="$XDG_CONFIG_HOME/shell"

export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# vim
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'

eval $(/opt/homebrew/bin/brew shellenv)
# rust
. "$HOME/.cargo/env"
