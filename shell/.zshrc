#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/neovim/build/bin:$HOME/bin:$HOME/.local/bin:$PATH

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  vi-mode
  docker
  docker-compose
  kubectl
  aws
  colored-man-pages
)

# complete -C aws_completer aws

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git aliases
alias gfp="git fetch && git pull"
alias gcn="git checkout -b"
# alias docker-build-amd="docker build --platform linux/amd64"
alias ranger=". ranger"

# vim
#export VIM_CONFIG="$HOME/.config/nvim/init.lua"
export EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/nvim'




export FZF_DEFAULT_OPTS="--color=light --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v


export BAT_THEME=gruvbox-light
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(fnm env)"
alias nvm="fnm"
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib



