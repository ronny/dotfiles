# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export LANG="en_AU.UTF-8"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$HOME/bin"
export MANPATH="/usr/local/man:$MANPATH"
export PAGER=less
export LESS="$LESS -C -S -R"
export VISUAL="vim"
export EDITOR="vim"
export BROWSER="w3m"
export LSCOLORS="Exfxcxdxbxegedabagacad"
export COLORFGBG="default;default"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
