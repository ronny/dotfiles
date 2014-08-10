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


# echo "zlogin"


# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Print a random, hopefully interesting, adage.
# if (( $+commands[fortune] )); then
#   fortune -a
#   print
# fi

######################################################################################

# Try loading rbenv first, then rvm.
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
elif [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
else
  if ! (( ${+USING_SYSTEM_RUBY_IS_FINE} )); then
    echo "Could not load rbenv or rvm, using system ruby."
  fi
fi

