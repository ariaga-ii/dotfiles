#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/neovim/build/bin:$HOME/bin:$HOME/.local/bin:$PATH
#

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  vi-mode
  docker
  docker-compose
  # kubectl
  aws
  colored-man-pages
  fzf-zsh-plugin
)
# export FZF_ALT_C_COMMAND="find -: . -mindepth 1 -type d \\( -path .git -o -path node_modules \\) -prune"
export FZF_DEFAULT_OPTS="--color=light --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# complete -C aws_completer aws

# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git aliases
alias gfp="git fetch && git pull"
alias gcn="git checkout -b"
# alias docker-build-amd="docker build --platform linux/amd64"
alias ranger=". ranger"

# vim
#export VIM_CONFIG="$HOME/.config/nvim/init.lua"
export EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/nvim'





bindkey -v


export BAT_THEME=gruvbox-light
eval "$(pyenv init -)"
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(fnm env)"
alias nvm="fnm"
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

source $HOME/databook/.databookrc

# eval "$(starship init zsh)"

# opam configuration
# [[ ! -r /Users/adam.juraszek/.opam/opam-init/init.zsh ]] || source /Users/adam.juraszek/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
# eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"
#
source ~/projects/gitstatus/gitstatus.prompt.zsh
PROMPT="%F{blue}%~%F{240}
%F{green}> %F{240}"
RPROMPT='$GITSTATUS_PROMPT'

fx() {
  SHELL_PID=$$ command fx
  cd "$(
    set -e
    if [ -n "$XDG_RUNTIME_DIR" ]; then
      local runtime_dir="$XDG_RUNTIME_DIR/felix"
    elif [ -n "$TMPDIR" ]; then
      local runtime_dir="$TMPDIR/felix"
    else
      local runtime_dir=/tmp/felix
    fi
    cat "$runtime_dir/$$"
    # Clean up the current and any leftover lwd files
    find "$runtime_dir" -type f -and \( -mtime +1s -or -name $$ \) -delete
  )"
}
source ~/.config/shell/funcs.sh
