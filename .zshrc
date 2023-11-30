export TERM=xterm-256color
export CLICOLOR=1
export KEYTIMEOUT=1
export PAGER=most

export EDITOR=nvim
export VISUAL="$EDITOR"

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
ZVM_CURSOR_STYLE_ENABLED=false
zplug "jeffreytse/zsh-vi-mode"

# Source plugins and add commands to $PATH
zplug load

################################################################################
# brew
################################################################################
export PATH=/opt/homebrew/bin:$PATH

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
export PYTHONPYCACHEPREFIX=$HOME/.pyc

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

if type rg &>/dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!**/{.git,node_modules,vendor}/*"'
fi
export FZF_DEFAULT_OPTS='-e -m --reverse --height 50% --border=sharp --bind "tab:toggle-out,shift-tab:toggle-in"'

################################################################################
# neovim
################################################################################
alias n=nvim

################################################################################
# vim
################################################################################
export VIMCONFIG=~/.vim
alias v=vim

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
alias tma='tmux a -d || tmux new -c ~'

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

################################################################################
# asdf
################################################################################
# asdf scripts need to be sourced after setting the $PATH and sourcing the
# framework (oh-my-zsh etc).
. /opt/homebrew/opt/asdf/libexec/asdf.sh
