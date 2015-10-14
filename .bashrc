#export PS1="\w\$ "
PS1="\[\033[1;34m\]\w\$\[\033[0m\] "
export PATH="$HOME/mongodb/bin:$HOME/dev/android-sdk-macosx/platform-tools:$HOME/dev/android-sdk-macosx/tools:/usr/local/bin/:/usr/local/git/bin:$PATH:$HOME/.rvm/bin:~/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Users/brendan/.rvm/gems/ruby-2.0.0-p481@sandglaz/bin:/usr/local/bin:/usr/local/heroku/bin:$HOME/.rvm/bin:$HOME/dev/android-sdk-macosx/build-tools/21.1.1:$HOME/npm/bin:$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

stty -ixon

export HISTCONTROL=ignoredups
export HISTSIZE=1000

alias lsa='ls -FA'
alias lsl='ls -FAlh'
alias gadd='git add -A && git status'
alias g='git status'
alias gd='git diff'
alias gstat='git status'
alias gcom='git commit'
alias glog='git log --pretty=oneline'
alias gch='git checkout'
alias gf='git flow'
alias sand='tmuxinator sandglaz'
alias lana='tmuxinator lana'
alias bhr='tmuxinator bhritchie'
alias habit='tmuxinator habitually'
alias mongod='mongod --config /Users/brendan/mongodb/bin/mongodb.config'
#cd ~/dev/sandglaz
#alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log'
#alias guard='bundle exec guard'
#alias rspec='bundle exec rspec'
#alias rails='bundle exec rails'
#alias rake='bundle exec rake'
#alias teaspoon='bundle exec teaspoon'

export EDITOR=vim
export GIT_EDITOR='vim +startinsert'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
