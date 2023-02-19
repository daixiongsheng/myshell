#!/bin/bash

function kd() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 process name"
    return 1
  fi
  ps aux | grep $1 | awk '{print $2}' | xargs kill -9
}

function resetGit() {
    git reset
    git checkout .
    git clean -fd
}

function mc() {
	mkdir $1 && cd $1
}


function gop() {
	url=`git remote get-url origin`
  if [[ $url =~ "git@.*" ]];
  then
    url=${url##git@}
    url=${url/:/\/}
    open https://$url
  else
    open $url
  fi
}


function server() {
  if [[ $1 == "" ]]; then
      open http://127.0.0.1
        python3 -m http.server 80
  else
      open http://127.0.0.1:$1
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
  if [[ $p == "" ]]
  then
    p=$PWD
  fi
  echo "export PATH=\$PATH:$p" >> ~/.zshrc
  source ~/.zshrc
}


function bsstop() {
  for i in "$@";
  do
    brew services stop $i
  done
}

function bsstart() {
  for i in "$@";
  do
    brew services start $i
  done
}

function bsrestart() {
  for i in "$@";
  do
    brew services restart $i
  done
}


function proxy() {
    export http_proxy=http://mac:9999
    export https_proxy=http://mac:9999
}


function kf() {
  cd $HOME/Documents/apps/kafka-map/
  nohup /Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home/bin/java -jar $HOME/Documents/apps/kafka-map/kafka-map.jar  > /dev/null 2>&1 &
}


function tools() {
  echo 'ag pt ack rg duf:df bat:cat tldr:man htop:top exa:ls axel:wget'
}


function push () {
  git config user.email daixiongsheng@gmail.com
  git add .
  date=$(date "+%Y-%m-%d-%H:%M:%S")
  echo $date $1
  git commit -m "$date $1"
  git push origin master
}


function gdr () {
  b=`git_current_branch`
  if [[ $1 != "" ]]
  then
    b=$1
  fi
  git diff "origin/$b"
}



function gid() {
  if [[ "" == $1 ]]
  then
    git rev-parse HEAD
  else
    git rev-parse $1
  fi
}


function rms() {
  from=$1
  to=$2
  if [[ "" == "$from" ]]
  then
    echo "useage: rms from to"
    return
  fi
  for file in `files`;
  do
    out=`echo $file | sed "s/$from/$to/g"`
    mv "$file" "$out"
  done
}

function m() {
  git checkout "release-$1"
}

function pc() {
  year=`date +%Y`
  if [[ $1 != "" ]]
  then
    git checkout "release-web-${year}.$1"
  else 
    git checkout develop
  fi
}

function kp() {
  lsof -i ":$1" | awk '{{print $2}}' | egrep '\d+' | xargs kill -9   
}


function mrpc() {
  year=`date +%Y`
  if [[ $1 != "" ]]
  then
    pnpm run mr "release-web-${year}.$1"
  else 
    pnpm run mr develop
  fi
}

function mrm() {
  if [[ $1 != "" ]]
  then
    pnpm run mr "release-$1"
  else 
    pnpm run mr develop
  fi
}

function slide() {
  nvm use 14
  lsof -i :4001 | awk '{{print $2}}' | egrep '\d+' | xargs kill -9
  lsof -i :3333 | awk '{{print $2}}' | egrep '\d+' | xargs kill -9
  emo start base &
  emo start web --dependencies
}

function slideweb() {
  nvm use 14
  lsof -i :4001 | awk '{{print $2}}' | egrep '\d+' | xargs kill -9
  lsof -i :3333 | awk '{{print $2}}' | egrep '\d+' | xargs kill -9
  emo start base &
  emo start web
}
