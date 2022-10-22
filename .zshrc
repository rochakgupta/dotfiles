export CLICOLOR=1

export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR

export KEYTIMEOUT=1

# edit command in editor
autoload -Uz edit-command-line
zle -N edit-command-line
# use \033 for ESC
bindkey '^X^E' edit-command-line

# java
export JAVA_HOME=`/usr/libexec/java_home -v 11`

# go
export PATH=$PATH:$HOME/go/bin

# rust
export PATH=$PATH:/Users/rochakgupta/.cargo/bin

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-vi-mode: https://github.com/jeffreytse/zsh-vi-mode
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# function zvm_after_init() {
  # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
export CONFIG_DIR=$HOME/.config/lazygit
alias c=lazygit

# yadm
function yc() {
    cd ~
    yadm enter lazygit
    cd -
}

# asdf scripts need to be sourced after setting the $PATH and sourcing the framework (oh-my-zsh etc).
. /usr/local/opt/asdf/libexec/asdf.sh
