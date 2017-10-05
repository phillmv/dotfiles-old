export EC2_HOME=~/.ec2
export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export AWS_ACCESS_KEY=`cat ~/.ec2/access_key`
export AWS_SECRET_KEY=`cat ~/.ec2/secret_key`
# export JAVA_HOME=~/Library/Java/JavaVirtualMachines/jdk1.7.0.jdk/Contents/Home
# export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export JRUBY_OPTS="-J-XX:MaxPermSize=1024M -J-Djruby.reify.classes=true"

export EDITOR='vim'
# export PS1='\[\033[01;32m\]\h\[\033[01;34m\]:\w $\[\033[00m\] '
export PS1='\[\e[1;32m\]\h\[\e[1;34m\]:\w $\[\e[00m\] '
export MANPATH=/Users/phillmv/local/share/man:$MANPATH
export PATH=/usr/local/Cellar/coreutils/8.15/libexec/gnubin:/usr/local/sbin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/mysql/scripts:$EC2_HOME/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export GOSRC="${GOPATH}/src"
export GOBIN="${GOPATH}/bin"

# LOLCLJ
export PATH=$PATH:/Users/phillmv/code/c/datomic/bin

alias ls='ls --color'
set -o vi

# omg http://unix.stackexchange.com/questions/105958/terminal-prompt-not-wrapping-correctly
shopt -s checkwinsize

export HISTSIZE=5000
export HISTCONTROL=ignoreboth
shopt -s histappend
export PROMPT_COMMAND="history -a"
# export CC=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2
# export CXX=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/g++-4.2
# export CPP=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/cpp-4.2




# lol history per andrew louis
PROMPT_COMMAND='history -a'
export HISTSIZE=999999
export HISTFILESIZE=999999999
export HISTTIMEFORMAT="%d/%m/%y %T "


# source ~/.bash_git.sh

alias f='open -a Finder '
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

alias g='open -a macvim'
alias v='mvim'
alias cherry='git cherry-pick'
alias status='git status'
alias branch='git branch'
alias add='git add'
alias commit='git commit'
alias log='git log'
alias checkout='git checkout'
alias grep='grep -rn --colour'
alias taggit='ctags -R --exclude=.git --exclude=log *'
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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
