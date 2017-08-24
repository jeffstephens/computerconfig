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
g() { "$(which git)" "$@" ;}
alias lint="git status | sed -n -e 's%^.*modified:   %./%p' | grep '.php$' | xargs -n1 php -l"
alias cls='clear'
export PATH=~/bin:$PATH
alias gp='git pull origin $parse_git_branch && git push origin $parse_git_branch'
alias l='ls -l'
alias m='cd ~/workspace/foxden-js'
alias gs='gulp serve'

if [ -f ~/.bash_profile_local ]; then
	. ~/.bash_profile_local
fi

# OS-specific stuff
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias cb='parse_git_branch | cut -d '\'')'\'' -f 1 | cut -d '\''('\'' -f 2 | xclip -selection clipboard'
elif [[ "$unamestr" == 'Darwin' ]]; then
  eval "$(thefuck --alias)"
  export NVM_DIR="/Users/jeffrey.stephens/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

  alias cb='parse_git_branch | cut -d '\'')'\'' -f 1 | cut -d '\''('\'' -f 2 | pbcopy'
fi
