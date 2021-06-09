parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# colors for use in bash prompt
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[01;32m\]"
CYAN="\[\033[01;36m\]"
CLEAR="\[\033[00m\]"
BRANCH=parse_git_branch
PS1="$GREEN\u@\h$CLEAR:$CYAN\w$CLEAR $YELLOW\$(parse_git_branch)$CLEAR \$ "

# colors for use in normal output with `echo -e`
NORMAL_GREEN="\033[0;32m"
NORMAL_YELLOW="\033[0;33m"
NORMAL_RED="\033[0;31m"
NORMAL_CLEAR="\033[0;00m"

alias gs='git status'
g() { "$(which git)" "$@" ;}
k() { "$(which kubectl)" "$@" ;}

# set kubectl namespace
ns() { $(which kubectl) config set-context $(kubectl config current-context) --namespace=$@ ;}

export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:~/bin:$PATH
alias gp='git pull origin $parse_git_branch && git push origin $parse_git_branch'
alias l='ls -al'

# better bash history - https://sanctum.geek.nz/arabesque/better-bash-history/
# append rather than overwriting after each terminal session
shopt -s histappend

# transform multi-line commands to a single line in bash history
shopt -s cmdhist

HISTFILESIZE=10000
HISTSIZE=10000

# ignore duplicates and lines that start with whitespace
HISTCONTROL=ignoreboth

HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

# persist bash history after each command
PROMPT_COMMAND='history -a'

if [ -f ~/.bash_profile_local ]; then
  . ~/.bash_profile_local
fi

# checkout a branch given a unique regex pattern
cob() {
  if [ -z $1 ]; then
    echo "Usage: cob <pattern to match git branch>"
    echo "Switch to a git branch based on a greppable pattern. Must specify an umambiguous pattern."
    return 1
  fi

  local pattern=$1
  local branchMatches=$(g branch | grep $pattern)

  # cannot proceed with more than one match
  local numMatches=$(echo "$branchMatches" | wc -l)
  if [ $numMatches != 1 ]; then
    echo -e "${NORMAL_YELLOW}Error: ambiguous pattern. The following branches matched:${NORMAL_CLEAR}"
    echo "$branchMatches"
    return 2
  fi

  # cannot proceed with no matches; we don't want to just run `git checkout`
  if [ -z "$branchMatches" ]; then
    echo -e "${NORMAL_RED}No matching branches were found. Available branches:${NORMAL_CLEAR}"
    g branch
    return 3
  fi

  trimmedBranch=$(echo "$branchMatches" | tr -d '[:space:]')
  echo -e "${NORMAL_GREEN}Switching to branch ${trimmedBranch}${NORMAL_CLEAR}"
  g checkout $trimmedBranch
}

# OS-specific stuff
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  alias cb='parse_git_branch | cut -d '\'')'\'' -f 1 | cut -d '\''('\'' -f 2 | xclip -selection clipboard'
elif [[ "$unamestr" == 'Darwin' ]]; then
  eval "$(thefuck --alias)"
  export NVM_DIR="/Users/$(whoami)/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

  alias cb='parse_git_branch | cut -d '\'')'\'' -f 1 | cut -d '\''('\'' -f 2 | pbcopy'
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

