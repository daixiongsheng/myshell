ZSH_THEME="adben"
plugins=(
  git
  z
  brew
  vscode
  man
  golang
  docker
  mvn
  node
  nvm
  redis-cli
  sublime
  zsh-autosuggestions
  zsh-syntax-highlighting
  brew
  sudo
  systemadmin
  systemd
)

if [ -f "$HOME/myshell/batch.sh" ]
then
  alias run="$HOME/myshell/batch.sh"
fi

if [ -f "$HOME/myshell/fun.sh" ]
then
  source $HOME/myshell/fun.sh
fi


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
alias c=clear
alias nsr="npm run server"
alias nst="npm run start"
alias dport="lsof -i "
alias ip='ifconfig -a | egrep "inet\s+.*" | egrep "([0-9]+\.){3}[0-9]+"'
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
alias "shv=ssh -o user=root"
alias "hip=history -i | grep"
alias "grget=git remote get-url origin"

alias "landnode"="arc land --keep-branchs --onto master  --revision"
alias "landrn"="arc land --keep-branchs --onto main  --revision"
alias "diffnode"="arc diff origin/master"
alias "diffrn"="arc diff origin/main"
alias "bsr=brew services restart"
alias "bs=brew services"
alias "file-count=ls -lR|grep "^-"|wc -l"
alias v="code ."

alias "wechat=nohup /Applications/WeChat.app/Contents/MacOS/WeChat > /dev/null &"
alias "hig=history -i | grep "
alias "dev=ssh daixiongsheng@dev.cc"
alias "p=pnpm"
alias nnode='node -e "const exit=()=>process.exit(0)" -i'
alias "ysm=yarn serve-m"
alias "ys=yarn start"
alias dir="ls -l | grep "^d" | awk '{print \$NF}'"
alias files="ls -l | grep "^-" | awk '{print \$NF}'"


