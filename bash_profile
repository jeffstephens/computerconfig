parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[01;32m\]"
CYAN="\[\033[01;36m\]"
CLEAR="\[\033[00m\]"
BRANCH=parse_git_branch
PS1="$GREEN\u@\h$CLEAR:$CYAN\w$CLEAR $YELLOW\$(parse_git_branch)$CLEAR \$ "
alias gs='git status'
v() { /usr/bin/vagrant "$@" ;}
g() { /usr/local/bin/git "$@" ;}
alias lint="git status | sed -n -e 's%^.*modified:   %./%p' | grep '.php$' | xargs -n1 php -l"
alias cls='clear'
export PATH=~/bin:$PATH
alias gp='git pull && git push'
alias l='ls -l'

