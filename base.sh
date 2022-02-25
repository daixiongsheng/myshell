
function kd() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 process name"
    return 1
  fi
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

function mc() {
	mkdir $1 && cd $1
}


function server() {
  if [[ $1 == "" ]]; then
        python3 -m http.server 80
  else
    python3 -m http.server $1
  fi;
}



function addAs() {
  if [ -f "$HOME/myshell/base.sh" ]
  then
    echo "alias \""$*"\"" >> ~/myshell/base.sh
  else
    echo "alias \""$*"\"" >> ~/.zshrc
  fi

  source ~/.zshrc
}


function addpath() {
  p=$1
  if [[ $p == "" ]] then;
    p=$PWD
  fi
  echo "export PATH=\$PATH:$p" >> ~/.zshrc
  source ~/.zshrc
}



function proxy() {
    export http_proxy=http://127.0.0.1:9999
    export https_proxy=http://127.0.0.1:9999
}


function kf() {
  cd $HOME/Documents/apps/kafka-map/
  nohup /Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home/bin/java -jar $HOME/Documents/apps/kafka-map/kafka-map.jar  > /dev/null 2>&1 &
}

function tools() {
  echo "ag  pt  gt awk bat:cat htop:top duf  tldr"
}


function push () {
  git config user.email daixiongsheng@gmail.com
  git add .
  date=$(date "+%Y-%m-%d-%H:%M:%S")
  echo $date $1
  git commit -m "$date $1"
  git push origin master
}



alias gsp="git stash pop"
alias gs="git stash"
alias gcz="git cz"
alias nid="npm install -D"
alias nr="npm run"
alias ns="npm run start"
alias nrd="npm run dev"
alias ni="npm i"
alias nig="npm i -g"
alias nt=netstat
alias tp="open -a Typora"
alias gor="go run"
alias hn="hexo new"
alias o="open ."
alias v="code ."
alias c=clear
alias al="ssh root@39.108.57.230"
alias kl="ssh parallels@192.168.1.207"
alias klr="ssh root@192.168.1.207"
alias nsr="npm run server"
alias nst="npm run start"
alias dport="lsof -i "
alias ip="ifconfig"
alias hi="history -i"
alias bi="brew install"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias webstorm=/Applications/WebStorm.app/Contents/MacOS/webstorm
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias j=z
alias dc=docker
alias dcc="docker container"
alias dr="docker run"
alias di="docker images"
alias "bss=brew search"
alias ari="arch -arm64 brew install"
alias "mong=mongod --config /opt/homebrew/etc/mongod.conf"
alias "gsl=git stash list"
alias "mute=sudo kill -9 \`ps ax|grep 'coreaudio[a-z]' |awk '{print \$1}'\`"
alias "gdoc=nohup godoc -http=:6060 > /dev/null 2>&1 &"
alias "rmqn=nohup mqnamesrv > /dev/null 2>&1 &"
alias "rmqb=nohup mqbroker -n localhost:9876 -c $HOME/Documents/apps/rocketmq/conf/broker.conf > /dev/null 2>&1 &"
alias "rmqc=nohup java -jar $HOME/Documents/apps/rocketmq-console/rocketmq-console/target/rocketmq-console-ng-1.0.0.jar > /dev/null 2>&1 &"
alias "es=nohup elasticsearch > /dev/null 2>&1 & "
alias "kb=nohup kibana > /dev/null 2>&1 & "
alias "eshead=pm2 restart grunt"
alias "go2=$HOME/Documents/repositories/go/bin/go tool go2go"
alias "zp=nohup java -jar $HOME/Documents/apps/ZooInspector/build/zookeeper-dev-ZooInspector.jar > /dev/null 2>&1 &"
alias "bs=brew services"
alias "shv=ssh -o user=root"


