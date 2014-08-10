# This file is similar to zlogin, but it is sourced before zshrc. It was added
# for ksh fans. See the description of zlogin below for what it may contain.
#
# zprofile and zlogin are not meant to be used concurrently but can be done so.
#
# zlogin is sourced by login shells after zshrc, and thus, it should contain
# commands that need to execute at login. It is usually used for messages such as
# [fortune][2], [msgs][3], or for the creation of files.
#
# zlogin is not the file to define aliases, functions, shell options, and key
# bindings. It should not change the shell environment.
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

# echo "zprofile"

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export LANG='en_AU.UTF-8'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-C -S -R'

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{share/npm/bin,bin,sbin}
  $path
  $HOME/bin
)


if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi


# Others
export LSCOLORS="Exfxcxdxbxegedabagacad"
export SUDO_PROMPT='[sudo] password for %u:'
export ARCHFLAGS="-arch x86_64"

# Python
export VIRTUALENV_USE_DISTRIBUTE=true
if [[ -x /usr/local/bin/python ]]; then
  export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python"
else
  py27=`which python2.7`
  echo "WARNING: using ${py27} as VIRTUALENVWRAPPER_PYTHON because /usr/local/bin/python is unavailable"
  export VIRTUALENVWRAPPER_PYTHON=${py27}
fi
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_DOWNLOAD_CACHE="$HOME/.pip/downloads"
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE="$WORKON_HOME"
