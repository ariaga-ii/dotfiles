DISABLE_UNTRACKED_FILES_DIRTY="true"
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file

# export FZF_ALT_C_COMMAND="find -: . -mindepth 1 -type d \\( -path .git -o -path node_modules \\) -prune"
export FZF_DEFAULT_OPTS="--color=light --inline-info"
export FZF_PATH=~/.fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export BAT_THEME=gruvbox-light

# git aliases
alias gfp="git fetch && git pull"
alias gcn="git checkout -b"
# alias docker-build-amd="docker build --platform linux/amd64"
alias ls="ls -G"


autoload -U compinit; compinit
source $ZDOTDIR/completion.zsh  
fpath=($XDG_CONFIG_HOME/zsh-completions/src $fpath)

bindkey -v
export KEYTIMEOUT=1

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export CPATH=/opt/homebrew/include
export LIBRARY_PATH=/opt/homebrew/lib

export PATH=$HOME/bin:$PATH

# setopt AUTO_PUSHD           # Push the current directory visited on the stack.
# setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
# setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
# alias d='dirs -v'
# for index ({1..9}) alias "$index"="cd +${index}"; unset index

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
        find "$runtime_dir" -type f -and \( -mtime +1s -or -name $$ \) -delete
    )"
}

cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

#

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
conda_setup() {
    __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

export PATH=/opt/homebrew/Caskroom/miniforge/base/bin:$PATH
# <<< conda initialize <<<

conda_info() {
    if [[ -n $CONDA_PREFIX ]]; then
        CONDA_ENV="($(basename $CONDA_PREFIX)) "
    else
        CONDA_ENV=""
    fi
}

# precmd_functions+=(conda_info)

#source ~/projects/gitstatus/gitstatus.prompt.zsh
# RPROMPT="%F{cyan}$CONDA_ENV%f"

# source $ZDOTDIR/prompt.zsh

PROMPT="%F{blue}%~%F{240}%F{green}
> %F{240}"

[ -f "/Users/adam/.ghcup/env" ] && source "/Users/adam/.ghcup/env" # ghcup-env
