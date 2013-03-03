export PATH="/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="ronny"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# NOTE: zsh-syntax-highlighting must be loaded before zsh-history-substring-search
plugins=(git gem pip rails3 zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

# Customize to your needs...

# vim: tw=0
