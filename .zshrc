export CLICOLOR=1
export KEYTIMEOUT=1

export EDITOR=/usr/local/bin/vim
export VISUAL=$EDITOR
export PAGER=most

################################################################################
# Plugin Management:
# zplug: https://github.com/zplug/zplug
################################################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Must be the last plugin sourced
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Must be loaded before zsh-autosuggestions
zplug "Aloxaf/fzf-tab"

zplug "zsh-users/zsh-autosuggestions"

# Source plugins and add commands to $PATH
zplug load

################################################################################
# Command editing
################################################################################
# Using vim bindings
bindkey -v

# Or in $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
# Ctrl+X followed by Ctrl+E in insert mode
bindkey '^X^E' edit-command-line
# Or v in normal mode
bindkey -M vicmd v edit-command-line

# Add text objects for quotes and brackets like da" and ci(
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

# Mimic Tim Pope's surround plugin
# Disabled as it conflicts with zsh-syntax-highlighting plugin
#
# autoload -Uz surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
# bindkey -M vicmd cs change-surround
# bindkey -M vicmd ds delete-surround
# bindkey -M vicmd ys add-surround
# bindkey -M visual S add-surround

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
export PYTHONPYCACHEPREFIX=$(pwd)/.pyc

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
