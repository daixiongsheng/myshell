export ESLINT_FIX=true
ZSH_THEME="adben"
plugins=(
	zsh-completions
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
	ag
	alias-finder
	aliases
	copyfile
	copypath
	dash
	dirhistory
	zsh-navigation-tools
	web-search
	wd
	urltools
	transfer
	timer
	thefuck
	sprunge
	python
	pip
	git-auto-fetch
	emoji
	command-not-found
	tmux
	tmuxinator
)

export RSPACK=true
export EDITOR=nvim
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_DEFAULT_SESSION_NAME=main
export ZSH_TMUX_AUTOCONNECT=true
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_AUTOSTART_ONCE=true
export ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
export XDG_CONFIG_HOME=$HOME/.config
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

if [ -f "$HOME/myshell/common.sh" ]; then
	source $HOME/myshell/common.sh
fi

alias gsp="git stash pop"
alias gs="git stash"
alias gcz="git cz"
alias nid="npm install -D"
alias nr="npm run"
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
alias "grget=git remote get-url origin"

alias "bsr=brew services restart"
alias "bs=brew services"
alias "fileCount"='ls -lR|grep "^-"|wc -l"'
alias v="code ."

alias "hig=history -i | grep "
alias "p=pnpm"
alias nnode='node -e "const exit=()=>process.exit(0)" -i'
alias "ysm=yarn serve-m"
alias "ys=yarn start"
alias dir="ls -l | grep '^d' | awk '{print \$NF}'"
alias files="ls -l | grep '^-' | awk '{print \$NF}'"
alias "nv=nvim"
alias "vi=nvim"
alias "pi=pnpm i"
alias "pig=pnpm i -g"
alias "piD=pnpm i -D"
alias "put=yarn ttdocx && yarn only-pub:ttdocx"
alias "pid=pnpm i -D"
alias "pst=pnpm run start"
alias "t=tmux"
alias "td=t detach"
alias "tk=tmux kill-session -t"
alias "tss=t switch -t"
alias "tsw=t splitw"
alias "tsp=t select-pane"
alias "tspu=tsp -U"
alias "tspd=tsp -D"
alias "tspl=tsp -L"
alias "tspr=tsp -R"
alias "tswh=tsw -h"
alias "n=nv ."
alias "k9=kill -9"
