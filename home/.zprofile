export PATH="/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

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
