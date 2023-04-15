export CLICOLOR=1
export KEYTIMEOUT=1

export EDITOR=/usr/local/bin/nvim
export VISUAL=$EDITOR
export PAGER=most

################################################################################
# Plugin Management:
# zplug: https://github.com/zplug/zplug
################################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Syntax highlighting
# Must be the last plugin sourced
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Autocomplete with fzf
# Must be loaded before zsh-autosuggestions
zplug "Aloxaf/fzf-tab"

# Suggestions
zplug "zsh-users/zsh-autosuggestions"

# Vi bindings
ZVM_CURSOR_STYLE_ENABLED=false
zplug "jeffreytse/zsh-vi-mode"

# Source plugins and add commands to $PATH
zplug load

################################################################################
# go
################################################################################
export PATH=$PATH:$HOME/go/bin

################################################################################
# java
################################################################################
export JAVA_HOME=`/usr/libexec/java_home -v 11`

################################################################################
# python
################################################################################
export PATH=$HOME/.local/bin:$PATH
export PYTHONPYCACHEPREFIX=$HOME/.pyc

################################################################################
# rust
################################################################################
. "$HOME/.cargo/env"

################################################################################
# starship
################################################################################
eval "$(starship init zsh)"

################################################################################
# zoxide
################################################################################
eval "$(zoxide init zsh)"

################################################################################
# fzf
################################################################################
function fzf_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# If zsh-vi-mode is used. Required because it overwrites existing keybindings
zvm_after_init_commands+=(fzf_init)
# Else
# fzf_init()

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi
export FZF_DEFAULT_OPTS='-e -m --reverse --height 50% --border=sharp'

################################################################################
# vifm
################################################################################
function f() {
    local dst="$(command vifm --choose-dir - "$@")"
    if [ -z "$dst" ]; then
        echo 'Directory picking cancelled/failed'
        return 1
    fi
    cd "$dst"
}

################################################################################
# lazygit
################################################################################
export CONFIG_DIR=$HOME/.config/lazygit
alias c=lazygit

################################################################################
# yadm
################################################################################
function yc() {
    cd ~
    yadm enter lazygit
    cd -
}

################################################################################
# brew
################################################################################
# Shell completion for tools installed by brew
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH="/usr/local/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

################################################################################
# asdf
################################################################################
# asdf scripts need to be sourced after setting the $PATH and sourcing the framework (oh-my-zsh etc).
. /usr/local/opt/asdf/libexec/asdf.sh
