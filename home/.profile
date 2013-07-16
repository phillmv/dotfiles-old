export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

export EDITOR='vim'
export PS1='\[\033[01;32m\]\h\[\033[01;34m\]:\w $\[\033[00m\] '
export MANPATH=/Users/phillmv/local/share/man:$MANPATH
export PATH=/usr/local/Cellar/coreutils/8.15/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/Users/phillmv/local/bin:/sw/bin:/usr/local/mysql/bin:/usr/local/mysql/scripts:$EC2_HOME/bin:$PATH
alias ls='ls --color'
set -o vi

export HISTSIZE=5000
export HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND="history -a"

source ~/.bash_git.sh

alias f='open -a Finder '
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias g='open -a macvim'
alias m='mvim'
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
alias redis='redis-server /usr/local/etc/redis.conf'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
function pgrest() { pg_restore --verbose --clean --no-acl --no-owner -h localhost -d $1 $2; }

alias hk='heroku'

extract () {
  if [ $# -ne 1 ]
  then
    echo "Error: No file specified."
    return 1
  fi
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2) tar xvjf $1   ;;
			*.tar.gz)  tar xvzf $1   ;;
			*.bz2)     bunzip2 $1    ;;
			*.rar)     unrar x $1    ;;
			*.gz)      gunzip $1     ;;
			*.tar)     tar xvf $1    ;;
			*.tbz2)    tar xvjf $1   ;;
			*.tgz)     tar xvzf $1   ;;
			*.zip)     unzip $1      ;;
			*.Z)       uncompress $1 ;;
			*.7z)      7z x $1       ;;
			*)         echo "'$1' cannot be extracted via extract" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }

reload_mysql() {
  db_name=`ruby -ryaml -e "puts YAML.load(File.read('config/database.yml'))['development']['database']"`
  echo Reloading $db_name with $1
  sleep 2
  bundle exec rake db:drop && bundle exec rake db:create && mysql -u root $db_name < $1
}


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
