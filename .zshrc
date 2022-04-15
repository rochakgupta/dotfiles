export CLICOLOR=1

export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR

# java
export JAVA_HOME=`/usr/libexec/java_home -v 11`

# go
export GOPATH=$HOME/go-workspace
export PATH=$PATH:$GOPATH/bin

# rust
export PATH=$PATH:/Users/rochakgupta/.cargo/bin

# conda
export PATH=/usr/local/anaconda3/bin:$PATH
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rochakgupta/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rochakgupta/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/rochakgupta/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rochakgupta/google-cloud-sdk/completion.zsh.inc'; fi

# android
# export PATH=~/Library/Android/sdk/platform-tools:$PATH

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-vi-mode: https://github.com/jeffreytse/zsh-vi-mode
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# fzf
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!**/{.git,node_modules,vendor}/*"'
fi

export FZF_DEFAULT_OPTS='-e -m --height 50% --border=sharp'

# vifm
function f() {
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

# lazygit
alias c=lazygit

# yadm
function yc() {
    cd ~
    yadm enter lazygit
    cd -
}
