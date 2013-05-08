# NOTE: set PATH in .zprofile
export PATH="/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

# System
export LANG="en_AU.UTF-8"

# Apps
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# Options
export LSCOLORS="Exfxcxdxbxegedabagacad"
export LESS="-C -S -R"
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
