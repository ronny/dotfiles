if status is-interactive
  # Commands to run in interactive sessions can go here

  set -U fish_greeting ""
end

#####################################################################
# Aliases
alias ls="ls -FGh"
if command -q nvim
  alias vi="nvim"
end
