if status is-interactive
    # Commands to run in interactive sessions can go here
    #starship init fish | source
end

#####################################################################
# Aliases
alias ls="ls -FGh"
if command -q nvim
  alias vi="nvim"
end
