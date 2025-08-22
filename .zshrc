################################################################################
# begin
################################################################################
export TERM=xterm-256color
export CLICOLOR=1
export KEYTIMEOUT=1
export XDG_CONFIG_HOME=$HOME/.config
export PATH=$HOME/.local/bin:$PATH

has() {
    command -v "$1" >/dev/null 2>&1
}

suppress_warn=0
warn() {
    if [[ $suppress_warn -eq 0 ]]; then
        echo "$1"
        return 1
    fi
}

err() {
    echo "$1"
    return 1
}

################################################################################
# brew
################################################################################
if [[ -d /opt/homebrew/bin ]]; then
    export PATH=/opt/homebrew/bin:$PATH
    eval "$(brew shellenv)"

    # Shell completion for tools installed by brew
    # https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
else
    warn "brew not found"
fi

################################################################################
# vim + neovim
################################################################################
export VIMCONFIG=~/.vim
export EDITOR=vim
export MANPAGER='vim -M +MANPAGER -'

alias v=vim
alias vv="vim -u NONE"

if has nvim; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'

    alias n=nvim
    alias nn="nvim --clean"
else
    warn "nvim not found"
fi

export VISUAL=$EDITOR

################################################################################
# zplug
################################################################################
if has brew && brew --prefix zplug >/dev/null 2>&1; then
    export ZPLUG_HOME=$(brew --prefix zplug)
    source $ZPLUG_HOME/init.zsh

    # Additional completions
    zplug "zsh-users/zsh-completions"

    # Syntax highlighting
    # Must be the last plugin sourced
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    # Autocomplete with fzf
    # Must be loaded before zsh-autosuggestions
    zplug "Aloxaf/fzf-tab"
    zstyle ':fzf-tab:*' fzf-min-height 10

    # Suggestions
    # Must be loaded after fzf-tab
    zplug "zsh-users/zsh-autosuggestions"

    # Vi bindings
    ZVM_CURSOR_STYLE_ENABLED=false
    zplug "jeffreytse/zsh-vi-mode"

    # Source plugins and add commands to $PATH
    zplug load

    if ! zplug check; then
        warn "run 'zplug install' to install missing plugins"
    fi
else
    warn "zplug not found"
fi

################################################################################
# mise
################################################################################
if has mise; then
    eval "$(mise activate zsh --shims)"
else
    warn "mise not found"
fi

################################################################################
# go
################################################################################
if has go; then
    export PATH=$PATH:$(go env GOPATH)/bin
else
    warn "go not found"
fi

################################################################################
# java
################################################################################
JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
if [[ -d $JAVA_HOME ]]; then
    export JAVA_HOME
else
    warn "$JAVA_HOME not found"
fi

################################################################################
# python
################################################################################
export PYTHONPYCACHEPREFIX=$HOME/.cache/pycache

activate() {
    local _file=".venv/bin/activate"
    if [[ -f $_file ]]; then
        source $_file
    else
        err "$_file not found"
    fi
}

################################################################################
# atuin
################################################################################
if has atuin; then
    export ATUIN_NOBIND="true"
    eval "$(atuin init zsh)"

    atuin_keybindings() {
        bindkey '^z' atuin-search
    }
    # Set atuin keybindings after zsh-vi-mode adds its keybindings to prevent atuin
    # keybindings from getting overwritten.
    zvm_after_init_commands+=(atuin_keybindings)
else
    warn "atuin not found"
fi

################################################################################
# docker
################################################################################
if has docker; then
    FPATH="$HOME/.docker/completions:${FPATH}"
fi

################################################################################
# fzf + rg
################################################################################
if has fzf; then
    if has rg; then
        export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!**/{.git,node_modules,vendor}/*"'
    else
        warn "rg not found"
    fi

    export FZF_DEFAULT_OPTS='
    --exact
    --multi
    --reverse
    --height 50%
    --border=sharp
    --bind "ctrl-x:clear-query"
    --bind "ctrl-f:preview-down"
    --bind "ctrl-b:preview-up"
    --bind "ctrl-d:preview-page-down"
    --bind "ctrl-u:preview-page-up"
    --bind "f3:toggle-preview-wrap"
    --bind "f4:toggle-preview"
    --bind "ctrl-space:toggle"
    --bind "ctrl-o:toggle-all"
    --bind "ctrl-l:clear-selection"
    --bind "ctrl-k:first"
    --bind "ctrl-j:last"
    --bind "ctrl-y:execute-silent(echo -n {+} | pbcopy)+abort"
    '

    fzf_init() {
        source <(fzf --zsh)
    }
    # Run fzf init script that adds fzf keybindings after zsh-vi-mode adds its
    # keybindings to prevent fzf keybindings from getting overwritten.
    zvm_after_init_commands+=(fzf_init)
else
    warn "fzf not found"
fi

################################################################################
# lazygit
################################################################################
if has lazygit; then
    alias c=lazygit
else
    warn "lazygit not found"
fi

################################################################################
# mangal
################################################################################
export MANGAL_CONFIG_PATH=~/.config/mangal

################################################################################
# starship
################################################################################
if has starship; then
    eval "$(starship init zsh)"
else
    warn "starship not found"
fi

################################################################################
# tmux
################################################################################
if has tmux; then
    alias ta='tmux a -d || tmux new -c ~'
else
    warn "tmux not found"
fi

################################################################################
# vifm
################################################################################
if has vifm; then
    f() {
        local _dir="$(command vifm --choose-dir - "$@")"
        if [ -z "$_dir" ]; then
            echo 'Directory picking cancelled/failed'
            return 1
        fi
        cd "$_dir"
    }
else
    warn "vifm not found"
fi

################################################################################
# yadm
################################################################################
if has yadm; then
    yc() (
        cd ~ && yadm enter lazygit
    )
else
    warn "yadm not found"
fi

################################################################################
# zathura
################################################################################
if has zathura; then
    zopen() {
        local _file
        if [[ $# -eq 0 ]]; then
            _file=$(find -E ~/Dropbox ~/Documents ~/Desktop ~/Downloads -regex ".*\.(pdf)" | fzf)
        elif [[ -d $1 ]]; then
            _file=$(find -E "$1" -regex ".*\.(pdf)" | fzf)
        else
            _file=$1
        fi

        if [[ -z $_file ]]; then
            echo 'No file specified'
            return 1
        fi

        local _file_type=$(file -b --mime-type "$_file")
        if [[ $_file_type == 'application/pdf'* ]]; then
            zathura "$_file" &
        else
            echo "$_file is $_file_type"
            return 1
        fi
    }
fi

################################################################################
# zoxide
################################################################################
if has zoxide; then
    eval "$(zoxide init zsh)"
else
    warn "zoxide not found"
fi

################################################################################
# end
################################################################################
autoload -Uz compinit && compinit -i
