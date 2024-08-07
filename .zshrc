export TERM=xterm-256color
export CLICOLOR=1
export KEYTIMEOUT=1

export EDITOR=nvim
export VISUAL="$EDITOR"

if [[ "$EDITOR" == "nvim" ]]; then
    export MANPAGER='nvim +Man!'
else
    export MANPAGER='vim -M +MANPAGER -'
fi

################################################################################
# Plugin Management:
# zplug: https://github.com/zplug/zplug
################################################################################
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Syntax highlighting
# Must be the last plugin sourced
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Autocomplete with fzf
# Must be loaded before zsh-autosuggestions
zplug "Aloxaf/fzf-tab"
zstyle ':fzf-tab:*' fzf-min-height 10

# Suggestions
zplug "zsh-users/zsh-autosuggestions"

# Vi bindings
ZSH_VI_MODE_ENABLED=1
if [[ "$ZSH_VI_MODE_ENABLED" == 1 ]]; then
    ZVM_CURSOR_STYLE_ENABLED=false
    zplug "jeffreytse/zsh-vi-mode"
fi

# Source plugins and add commands to $PATH
zplug load

################################################################################
# brew
################################################################################
export PATH=/opt/homebrew/bin:$PATH

################################################################################
# mise
################################################################################
eval "$(mise activate zsh --shims)"

################################################################################
# go
################################################################################
export PATH=$PATH:$(go env GOPATH)/bin

################################################################################
# java
################################################################################
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home

################################################################################
# python
################################################################################
export PATH=$HOME/.local/bin:$PATH
export PYTHONPYCACHEPREFIX=$HOME/.cache/pycache
alias activate="source .venv/bin/activate"

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
if type rg &>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!**/{.git,node_modules,vendor}/*"'
fi

export FZF_DEFAULT_OPTS='
--exact
--multi
--reverse
--height 50%
--border=sharp
--bind "ctrl-l:clear-query"
--bind "alt-a:beginning-of-line"
--bind "alt-e:end-of-line"
--bind "ctrl-f:preview-down"
--bind "ctrl-b:preview-up"
--bind "ctrl-d:preview-page-down"
--bind "ctrl-u:preview-page-up"
--bind "f3:toggle-preview-wrap"
--bind "f4:toggle-preview"
--bind "tab:toggle-out"
--bind "shift-tab:toggle-in"
--bind "ctrl-space:toggle"
--bind "ctrl-o:toggle-all"
--bind "alt-l:clear-selection"
--bind "ctrl-k:first"
--bind "ctrl-j:last"'

function fzf_init() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Run fzf's init script that adds fzf keybindings after zsh-vi-mode adds its
# keybindings to prevent fzf keybindings from getting overwritten.
if [[ "$ZSH_VI_MODE_ENABLED" == 1 ]]; then
    zvm_after_init_commands+=(fzf_init)
else
    fzf_init
fi

################################################################################
# atuin
################################################################################
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

function atuin_keybindings() {
    bindkey '^z' atuin-search
}

# Set atuin keybindings after zsh-vi-mode adds its keybindings to prevent atuin
# keybindings from getting overwritten.
if [[ "$ZSH_VI_MODE_ENABLED" == 1 ]]; then
    zvm_after_init_commands+=(atuin_keybindings)
else
    atuin_keybindings
fi

################################################################################
# neovim
################################################################################
alias n=nvim
alias nc="nvim --clean"

################################################################################
# vim
################################################################################
export VIMCONFIG=~/.vim
alias v=vim
alias vc="vim -u NONE"

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
# tmux
################################################################################
alias ta='tmux a -d || tmux new -c ~'

################################################################################
# yadm
################################################################################
function yc() (
    cd ~
    yadm enter lazygit
)

################################################################################
# brew
################################################################################
# Shell completion for tools installed by brew
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
    FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
    FPATH="/opt/homebrew/share/zsh-completions:${FPATH}"

    autoload -Uz compinit && compinit -i
fi
