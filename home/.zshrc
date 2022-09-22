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
# ---07. ~/.zpreztorc
# 08. /etc/zlogin
# 09. ~/.zlogin
# 10. ~/.zlogout
# 11. /etc/zlogout

# echo "zshrc"

# Uncomment for profiling (see also the end of this file)
# zmodload zsh/zprof

# Use zgenom to load prezto, don't load prezto directly
# https://github.com/jandamm/zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# if the init script doesn't exist
if ! zgenom saved; then
    echo "Creating a zgenom save"

    # prezto module options
    zgenom prezto editor key-bindings 'emacs'
    zgenom prezto editor dot-expansion 'yes'
    zgenom prezto syntax-highlighting highlighters 'main' 'brackets' 'pattern' 'cursor' 'root'
    zgenom prezto terminal auto-title 'yes'
    zgenom prezto terminal:window-title format '%n@%m: %s'
    zgenom prezto terminal:tab-title format '%1d'
    # zgenom prezto tmux:auto-start local 'yes'
    zgenom prezto tmux:auto-start remote 'yes'

    # prezto and modules
    zgenom prezto
    zgenom prezto environment
    zgenom prezto terminal
    zgenom prezto editor
    zgenom prezto history
    zgenom prezto directory
    zgenom prezto spectrum
    zgenom prezto utility
    zgenom prezto completion
    zgenom prezto history-substring-search
    zgenom prezto command-not-found
    zgenom prezto syntax-highlighting
    zgenom prezto autosuggestions

    # plugins
    # zgenom load /path/to/super-secret-private-plugin

    # save all to init script
    zgenom save
fi

# Use zgenom to load prezto, don't load prezto directly
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

######################################################################################
# Customisations

# Include our custom completions
fpath=(~/.zsh/completions $fpath)

# no duplicates in paths
typeset -gU cdpath fpath mailpath path

# No corrections, please. Ever.
unsetopt CORRECT

# Completion behaviour
# autoload -U compinit
# compinit
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
# show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2
setopt auto_param_slash
setopt no_auto_remove_slash
setopt complete_aliases
setopt no_beep

# Aliases
alias ls='ls -FGh'
alias kd='kubectl --context gseks-development'
alias kp='kubectl --context gseks-production'

# Keybindings
# Default to emacs style, then override as necessary
bindkey -e
bindkey "^F" history-beginning-search-backward
bindkey "^G" history-beginning-search-forward

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm; --no-use makes it fast

  # Auto load nvm after cd
  # place this after nvm initialization!
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  # add-zsh-hook chpwd load-nvmrc
  # load-nvmrc
fi

# . "$(brew --prefix asdf)/libexec/asdf.sh"
# . "$(brew --prefix asdf)/share/zsh/site-functions/_asdf"

# eval "$(kubectl completion zsh)"
# eval "$(helm completion zsh)"

# if [[ -x $(brew --prefix)/bin/aws_completer ]]; then
#   # echo "Sourcing awscli completion..."
#   complete -C '$(brew --prefix)/bin/aws_completer' aws
# fi

# if [[ -e ~/.iterm2_shell_integration.zsh ]]; then
#   # echo "Sourcing iterm2 shell integration..."
#   source ~/.iterm2_shell_integration.zsh
# fi

# eval "$(pyenv init -)"

# if [[ -x $(brew --prefix)/bin/pipenv ]]; then
  # eval "$(pipenv --completion)"
# fi

if [[ -x "/opt/homebrew/bin/starship" || -x "/usr/local/bin/starship" ]]; then
 eval "$(starship init zsh)"
fi


# Use zgenom to load prezto, don't load prezto directly
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Uncomment to print out the result of profiling (typically start up only; see also the top of this file)
# zprof

export PATH="$HOME/.poetry/bin:$PATH"

# bun completions
[ -s "/Users/ronny/.bun/_bun" ] && source "/Users/ronny/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/ronny/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# BEGIN_AWS_SSO_CLI

# AWS SSO requires `bashcompinit` which needs to be enabled once and
# only once in your shell.  Hence we do not include the two lines:
#
# autoload -Uz +X compinit && compinit
# autoload -Uz +X bashcompinit && bashcompinit
#
# If you do not already have these lines, you must COPY the lines
# above, place it OUTSIDE of the BEGIN/END_AWS_SSO_CLI markers
# and of course uncomment it

__aws_sso_profile_complete() {
     local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    _multi_parts : "($(/opt/homebrew/bin/aws-sso list --csv $_args Profile))"
}

aws-sso-profile() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -n "$AWS_PROFILE" ]; then
        echo "Unable to assume a role while AWS_PROFILE is set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso $_args eval -p "$1")
    if [ "$AWS_SSO_PROFILE" != "$1" ]; then
        return 1
    fi
}

aws-sso-clear() {
    local _args=${AWS_SSO_HELPER_ARGS:- -L error}
    if [ -z "$AWS_SSO_PROFILE" ]; then
        echo "AWS_SSO_PROFILE is not set"
        return 1
    fi
    eval $(/opt/homebrew/bin/aws-sso -sso eval $_args -c)
}

compdef __aws_sso_profile_complete aws-sso-profile
complete -C /opt/homebrew/bin/aws-sso aws-sso

# END_AWS_SSO_CLI
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
