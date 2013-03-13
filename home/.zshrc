######################################################################################
# oh-my-zsh settings

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true


######################################################################################
# Antigen — A zsh plugin manager

export ANTIGEN_DEFAULT_REPO_URL="git@github.com:ronny/oh-my-zsh.git"
source ~/.zsh-antigen/antigen.zsh

# Load oh-my-zsh
antigen-lib

# Bundles from the default repo (see ANTIGEN_DEFAULT_REPO_URL)
antigen-bundle bundler
antigen-bundle npm
antigen-bundle virtualenvwrapper

# Other bundles
antigen-bundle zsh-users/zsh-completions src
# NOTE: zsh-syntax-highlighting must be loaded before zsh-history-substring-search
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen-theme ronny

# Tell antigen that you're done.
antigen-apply

######################################################################################
# Other customisations.

# Removes duplicates in PATH.
typeset -U path

# No corrections, please.
unsetopt correct_all

# Completion behaviour
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
