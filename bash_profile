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
alias cb='parse_git_branch | cut -d '\'')'\'' -f 1 | cut -d '\''('\'' -f 2 | pbcopy'
v() { /usr/local/bin/vagrant "$@" ;}
>>>>>>> Stashed changes
g() { /usr/local/bin/git "$@" ;}
alias lint="git status | sed -n -e 's%^.*modified:   %./%p' | grep '.php$' | xargs -n1 php -l"
alias cls='clear'
export PATH=~/bin:$PATH
alias gp='git pull origin $parse_git_branch && git push origin $parse_git_branch'
alias l='ls -l'
alias m='cd ~/workspace/ionic_collab'
alias gs='gulp serve'

# ReadyTalk Aliases
alias buildandroid='pushd ~/workspace/ionic_collab && say "Android build started" && ./gradlew buildAndroid && adb install -r /Users/jeffrey.stephens/workspace/ionic_collab/platforms/android/build/outputs/apk/android-armv7-debug.apk && popd && say "Android build complete"'
alias webe2e='pushd ~/workspace/ionic_collab && say "Web End To End Tests Started" && gulp package:web && gulp e2e && popd && say "Web End To End Tests Complete"'

source ~/git-completion.bash

export NVM_DIR="/Users/jeffrey.stephens/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
