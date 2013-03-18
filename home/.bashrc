shopt -s histappend
export PROMPT_COMMAND='history -a'

alias port="echo \"Use 'brew' instead.\""
alias ports="echo \"It's called 'port', not 'ports'. But, use 'brew' instead.\""
alias fink="echo \"Use 'port' instead.\""
alias sudo="sudo -p \"[sudo] password for %u:\""
alias ls='ls -FG'

export GIT_PS1_SHOWDIRTYSTATE="youbet"
source ~/.git-completion.bash
source ~/.hg-completion.bash
export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[01;31m\]\[\033[01;34m\]\$ \[\033[00m\]'
