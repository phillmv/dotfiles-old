export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

export EDITOR='vim'
export PS1='\[\033[01;32m\]\h\[\033[01;34m\]:\w $\[\033[00m\] '
export MANPATH=/Users/phillmv/local/share/man:$MANPATH
export PATH=/usr/local/Cellar/coreutils/8.15/libexec/gnubin:/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/Users/phillmv/local/bin:/sw/bin:/usr/local/mysql/bin:/usr/local/mysql/scripts:$EC2_HOME/bin:$PATH
alias ls='ls --color'
set -o vi

export HISTSIZE=2000
export HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND="history -a"

alias g='open -a macvim'
alias cherry='git cherry-pick'
alias status='git status'
alias branch='git branch'
alias add='git add'
alias commit='git commit'
alias log='git log'
alias checkout='git checkout'
alias grep='grep -rn --colour'
alias taggit='ctags -R --exclude=.git --exclude=log *'
alias ack='ack -a'
alias be="bundle exec"
alias bes="be snapshot"
alias prc='pry -r .config/environment'

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
