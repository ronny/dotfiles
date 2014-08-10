# This file is sourced by interactive shells. It should define aliases,
# functions, shell options, and key bindings.
#
# Load order:
# 01. /etc/zshenv
# 02. ~/.zshenv
# 03. /etc/zprofile
# 04. ~/.zprofile
# 05. /etc/zshrc
# 06. ~/.zshrc
# 07. ~/.zpreztorc
# 08. /etc/zlogin
# 09. ~/.zlogin
# 10. ~/.zlogout
# 11. /etc/zlogout

# echo "zshrc"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

######################################################################################
# Customisations

# no duplicates in paths
typeset -gU cdpath fpath mailpath path

# No corrections, please. Ever.
unsetopt CORRECT

# Completion behaviour
autoload -U compinit
compinit
# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
setopt auto_param_slash
setopt no_auto_remove_slash
setopt complete_aliases
setopt no_beep

# Aliases
alias ls='ls -FGh'

# Keybindings
# Default to emacs style, then override as necessary
bindkey -e
bindkey "^F" history-beginning-search-backward
bindkey "^G" history-beginning-search-forward

