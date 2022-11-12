#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:$PATH
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git
  vi-mode
  # docker
  # docker-compose
  # kubectl
  # aws
  colored-man-pages
  fzf-zsh-plugin
)


source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# git aliases
alias gfp="git fetch && git pull"
alias gcn="git checkout -b"
alias ranger=". ranger"

# vim
#export VIM_CONFIG="$HOME/.config/nvim/init.lua"
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'

export FZF_DEFAULT_OPTS="--color=light --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



## VIM
bindkey -v


export BAT_THEME=gruvbox-light
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme




