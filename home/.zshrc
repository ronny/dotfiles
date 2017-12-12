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

# Include our custom completions
fpath=(~/.zsh/completions $fpath)

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
alias be='bundle exec'

# requires `brew install thefuck`
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias dhelm='docker run --rm -v $PWD/.kube/config:/root/.kube/config dtzar/helm-kubectl:2.6.2 helm'

# Keybindings
# Default to emacs style, then override as necessary
bindkey -e
bindkey "^F" history-beginning-search-backward
bindkey "^G" history-beginning-search-forward

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

if [[ -x /usr/local/bin/kubectl ]]; then
  # echo "Sourcing kubectl completion..."
  source <(/usr/local/bin/kubectl completion zsh)
fi

if [[ -x /usr/local/bin/helm ]]; then
  # echo "Sourcing helm completion..."
  source <(/usr/local/bin/helm completion zsh)
fi

# Commented out because it's breaking completion for everything else
# if [[ -x /usr/local/bin/aws-vault ]]; then
#   echo "Sourcing aws-vault completion..."
#   source <(/usr/local/bin/aws-vault --completion-script-zsh)
# fi

if [[ -x /usr/local/bin/aws_zsh_completer.sh ]]; then
  # echo "Sourcing awscli completion..."
  source /usr/local/bin/aws_zsh_completer.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ -e ~/.iterm2_shell_integration.zsh ]]; then
  # echo "Sourcing iterm2 shell integration..."
  source ~/.iterm2_shell_integration.zsh
fi
