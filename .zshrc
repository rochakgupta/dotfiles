export CLICOLOR=1
export KEYTIMEOUT=1

export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR
export PAGER=most

################################################################################
# zplug: zsh plugin manager
# https://github.com/zplug/zplug
################################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# must be the last plugin sourced
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

# source plugins and add commands to $PATH
zplug load

################################################################################
# command editing
################################################################################
# using vim bindings
bindkey -v

# or in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
# Ctrl+X followed by Ctrl+E in insert mode
bindkey '^X^E' edit-command-line
# or v in normal mode
bindkey -M vicmd v edit-command-line

# add text objects for quotes and brackets like da" and ci(
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# mimic Tim Pope's surround plugin
# disabled as it conflicts with zsh-syntax-highlighting
# autoload -Uz surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
# bindkey -M vicmd cs change-surround
# bindkey -M vicmd ds delete-surround
# bindkey -M vicmd ys add-surround
# bindkey -M visual S add-surround

################################################################################
# java
################################################################################
export JAVA_HOME=`/usr/libexec/java_home -v 11`

################################################################################
# go
################################################################################
export PATH=$PATH:$HOME/go/bin

################################################################################
# rust
################################################################################
export PATH=$PATH:/Users/rochakgupta/.cargo/bin

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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!**/{.git,node_modules,vendor}/*"'
fi
export FZF_DEFAULT_OPTS='-e -m --height 50% --border=sharp'

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
# shell completion for tools installed by brew
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
