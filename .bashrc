export PS1="\w$ "
export PATH="/usr/local/bin/:/usr/local/git/bin:$PATH:$HOME/.rvm/bin:~/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/Users/brendan/.rvm/gems/ruby-2.0.0-p481@sandglaz/bin:/usr/local/bin:/usr/local/heroku/bin:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

stty -ixon

alias lsa='ls -FA'
alias lsl='ls -FAlh'
alias gadd='git add -A && git status'
alias gstat='git status'
alias gcom='git commit'
alias glog='git log --pretty=oneline'
alias sand='tmuxinator sandglaz'
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
