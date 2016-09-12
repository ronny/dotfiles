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

# Try loading rbenv first, then rvm.
if which rbenv > /dev/null; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
elif [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
    export PATH="$HOME/.rvm/bin:$PATH"
    source "$HOME/.rvm/scripts/rvm"
else
    if [ -z $USING_SYSTEM_RUBY_IS_FINE ]; then
	echo "Could not load rbenv or rvm, using system ruby."
    fi
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
