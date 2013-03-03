# apps
export BROWSER="Chrome"
export EDITOR="vim"
export PAGER="less"
export VISUAL="vim"

# options
export LSCOLORS="Exfxcxdxbxegedabagacad"
export LESS="-C -S -R"
export SUDO_PROMPT='[sudo] password for %u:'

# libs
export NODE_PATH="/usr/local/lib/node_modules"
#export IMAGEMAGICK_ROOT="/usr/local/bin"
export ANDROID_HOME="$HOME/src/android-sdk-mac_x86"

# system stuff
export LANG="en_AU.UTF-8"

# Do PATH in ~/.zshrc (wtf?!) instead
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

#export ARCHFLAGS="-arch i386 -arch x86_64"
export ARCHFLAGS="-arch x86_64"

# python stuff
export VIRTUALENV_USE_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_DOWNLOAD_CACHE="$HOME/.pip/downloads"
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE="$WORKON_HOME"

# unlimited history (mainly psql)
#export HISTFILESIZE=
#export HISTSIZE=

# vim:tw=0
