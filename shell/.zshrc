#

# place default node version under $HOME/.node-version
# load-nvmrc() {
#   DEFAULT_NODE_VERSION=`cat $HOME/.node-version`
#   if [[ -f .nvmrc && -r .nvmrc ]]; then
#     fnm use
#   elif [[ `node -v` != $DEFAULT_NODE_VERSION ]]; then
#     echo Reverting to node from "`node -v`" to "$DEFAULT_NODE_VERSION"
#     fnm use $DEFAULT_NODE_VERSION
#   fi
# }
#
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
#Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc. Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/neovim/build/bin:$HOME/bin:$HOME/.local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# git aliases
alias gfp="git fetch && git pull"
alias gcn="git checkout -b"

# vim
#export VIM_CONFIG="$HOME/.config/nvim/init.lua"
export EDITOR='/opt/homebrew/bin/nvim'
export VISUAL='/opt/homebrew/bin/nvim'

# export DOTFILES="$ADAM/dotfiles"
alias zshconfig="nvim $DOTFILES/.zshrc +"
alias vimconfig="nvim $DOTFILES/nvim"
#
# dockerstop() {
#   docker rm $(docker stop $(docker ps -a -q --filter ancestor="$1" --format="{{.ID}}"))
# }
#
# eval "$(jump shell zsh)"



# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    # --color=fg:-1,bg:-1,hl:#62819e'
export FZF_DEFAULT_OPTS="--color=light --inline-info"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#krew
# export PATH="${PATH}:${HOME}/.krew/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<



# export PATH=$HOME/.pyenv/bin:$PATH
# 
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# 
# export PATH="$HOME/.poetry/bin:$PATH"
# source $HOME/.poetry/env




## VIM
bindkey -v


# alias docker-build-amd="docker build --platform linux/amd64"
export BAT_THEME=gruvbox-light
# source $HOME/.config/open-api/config
#
# # opam configuration
# [[ ! -r /Users/adam/.opam/opam-init/init.zsh ]] || source /Users/adam/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
#
alias ranger=". ranger"

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(fnm env)"
alias nvm="fnm"
# autoload -U add-zsh-hook
#
#
export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib



