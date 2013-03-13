######################################################################################
# oh-my-zsh setting vars

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS=true

######################################################################################
# Antigen — A zsh plugin manager

export ANTIGEN_DEFAULT_REPO_URL=git@github.com:ronny/oh-my-zsh.git
source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-lib

# Bundles from the default repo (see ANTIGEN_DEFAULT_REPO_URL)
antigen-bundle brew
antigen-bundle bundler
antigen-bundle coffee
antigen-bundle django
antigen-bundle gem
antigen-bundle github
antigen-bundle heroku
antigen-bundle lein
antigen-bundle npm
antigen-bundle pip
antigen-bundle redis-cli
antigen-bundle rvm

# Only in ubuntu
#antigen-bundle command-not-found

antigen-bundle kennethreitz/autoenv

# Syntax highlighting bundle.
# NOTE: zsh-syntax-highlighting must be loaded before zsh-history-substring-search
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen-theme ronny/oh-my-zsh themes/ronny

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
