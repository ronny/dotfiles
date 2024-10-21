if status is-interactive
  # Commands to run in interactive sessions can go here

  set -U fish_greeting ""
end

#####################################################################
# Paths are done in a single place here so we can see everything
# because the order matters and we don't want any nasty suprises.

if test -d "$HOME/bin"
  fish_add_path --append "$HOME/bin"
end
if test -d "$HOME/go/bin"
  fish_add_path --append "$HOME/go/bin"
end
if test -d "$HOME/zig"
  for f in $HOME/zig/*
    if test -d "$f"
      fish_add_path --append "$f"
    end
  end
end

#####################################################################

if test -x /opt/homebrew/bin/brew
  /opt/homebrew/bin/brew shellenv | source
end

if test -e "$HOME/.asdf/asdf.fish"
  source "$HOME/.asdf/asdf.fish"
end

if command -q direnv
  direnv hook fish | source
end

if test -e "$HOME/.cargo/env.fish"
  source "$HOME/.cargo/env.fish"
end


#####################################################################
# Aliases

alias ls="ls -FGh"
if command -q nvim
  alias vi="nvim"
end
if command -q kubectl
  alias ks="kubectl --context staging"
  alias kpre="kubectl --context preprod"
  alias kp="kubectl --context prod"
  alias kpus="kubectl --context prod-us"
end
