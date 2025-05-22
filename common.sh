#!/bin/bash

function kd() {
	if [[ -z "$1" ]]; then
		echo "Usage: $0 process name"
		return 1
	fi
	ps aux | grep -i $1 | awk '{print $2}' | xargs kill -9
}

function resetGit() {
	git reset
	git checkout .
	git clean -fd
}

function mc() {
	mkdir -p $1 && cd $1
}

function gop() {
	url=$(git remote get-url origin)
	if [[ $url =~ "git@.*" ]]; then
		url=${url##git@}
		url=${url/:/\/}
		open https://$url
	else
		open $url
	fi
}

function gopc() {
	branch=$(git rev-parse --abbrev-ref HEAD)
	url=$(git remote get-url origin)
	if [[ $url =~ "git@.*" ]]; then
		url=${url##git@}
		url=${url/:/\/}
		url=${url/.git/}
		open https://$url/tree/$branch
	else
		open $url/tree/$branch
	fi
}

function server() {
	if [[ $1 == "" ]]; then
		open http://127.0.0.1
		python3 -m http.server 80
	else
		open http://127.0.0.1:$1
		python3 -m http.server $1
	fi
}

function addAs() {
	if [ -f "$HOME/myshell/base.sh" ]; then
		echo "alias \""$*"\"" >>~/myshell/base.sh
	else
		echo "alias \""$*"\"" >>~/.zshrc
	fi

	source ~/.zshrc
}

function addpath() {
	p=$1
	if [[ $p == "" ]]; then
		p=$PWD
	fi
	echo "export PATH=\$PATH:$p" >>~/.zshrc
	source ~/.zshrc
}

function bsstop() {
	for i in "$@"; do
		brew services stop $i
	done
}

function bsstart() {
	for i in "$@"; do
		brew services start $i
	done
}

function bsrestart() {
	for i in "$@"; do
		brew services restart $i
	done
}

function proxy() {
	export http_proxy=http://mac:9999
	export https_proxy=http://mac:9999
}

function unproxy() {
	unset http_proxy
	unset https_proxy
}

function kf() {
	cd $HOME/Documentss/apps/kafka-map/
	nohup /Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home/bin/java -jar $HOME/Documentss/apps/kafka-map/kafka-map.jar >/dev/null 2>&1 &
}

function tools() {
	echo 'ag pt ack rg duf:df bat:cat tldr:man htop:top exa:ls axel:wget'
}

function push_github() {
	git config user.email daixiongsheng@gmail.com
	git add .
	date=$(date "+%Y-%m-%d-%H:%M:%S")
	echo $date $1
	git commit -m "$date $1"

	git push
}

function gdr() {
	b=$(git_current_branch)
	if [[ $1 != "" ]]; then
		b=$1
	fi
	git diff "origin/$b"
}

function gid() {
	if [[ "" == $1 ]]; then
		git rev-parse HEAD
	else
		git rev-parse $1
	fi
}

function rms() {
	from=$1
	to=$2
	if [[ "" == "$from" ]]; then
		echo "useage: rms from to"
		return
	fi
	for file in $(files); do
		out=$(echo $file | sed "s/$from/$to/g")
		mv "$file" "$out"
	done
}

function m() {
	git checkout "release-$1"
}

function pc() {
	year=$(date +%Y)
	prev=$(($year - 1))
	next=$(($year + 1))
	if [[ $1 != "" ]]; then
		b1="release-web-${prev}.$1"
		b2="release-web-${year}.$1"
		b3="release-web-${next}.$1"

		for b in $b2 $b1 $b3; do
			ret=$(git branch -a | grep $b)
			if [[ $ret != "" ]]; then
				git checkout $b
				return
			fi
		done
	else
		git checkout develop
	fi
}

function kp() {
	lsof -i ":$1" | awk '{{print $2}}' | egrep '[0-9]+' | xargs kill -9
}

function mrpc() {
	year=$(date +%Y)
	if [[ $1 != "" ]]; then
		pnpm run mr "release-web-${year}.$1"
	else
		pnpm run mr develop
	fi
}

function mrm() {
	if [[ $1 != "" ]]; then
		pnpm run mr "release-$1"
	else
		pnpm run mr develop
	fi
}

function closeSlide() {
	p1=$(lsof -i :4001 | awk '{{print $2}}' | egrep '[0-9]+')
	p2=$(lsof -i :3333 | awk '{{print $2}}' | egrep '[0-9]+')

	if [[ $p1 != "" ]]; then
		lsof -i :4001 | awk '{{print $2}}' | egrep '[0-9]+' | xargs kill -9
	fi

	if [[ $p2 != "" ]]; then
		lsof -i :3333 | awk '{{print $2}}' | egrep '[0-9]+' | xargs kill -9
	fi
}

function slide_front() {
	closeSlide
	emo start base &
	emo start web --dependencies &
}

function slide() {
	branch=$(git rev-parse --abbrev-ref HEAD)
	export BUILD_REPO_BRANCH=$branch
	closeSlide
	emo start web --dependencies
}

function slide_width_base() {
	closeSlide
	emo start base &
	emo start web --dependencies
}

function proxySlide() {
	ip=$1
	port=$2
	if [[ $port == "" ]]; then
		port="4001"
	fi

	if [[ $ip == "" ]]; then
		ip=10.37.72.29
	fi
	gost "-L=tcp://:$port/$ip:$port"
}

function resetRemote() {
	year=$(date +%Y)
	if [[ $1 != "" ]]; then
		git reset "origin/release-web-${year}.$1"
	else
		git reset origin/develop
	fi
}

function ggcb() {
	year=$(date +%Y)
	if [[ $2 != "" ]]; then
		git checkout -b $1 "origin/release-web-${year}.$2"
	else
		git checkout -b $1 origin/develop
	fi
}

function delEmpBranch() {
	git fetch -p
	for b in $(git branch --list); do
		ret=$(git branch --remotes | grep "origin/$b$")
		if [[ "" == $ret && "*" != $b ]]; then
			git branch --delete --force $b
		fi

		if [[ $b =~ "release-*" ]]; then
			git branch --delete --force $b
		fi
	done
}

function resetOrigin() {
	year=$(date +%Y)
	branch=$1
	b1="origin/release-web-${year}.$1"
	b2="origin/$1"

	for b in $b1 $b2; do
		ret=$(git branch -a | grep -e "$b\$")
		if [[ $ret != "" ]]; then
			for file in $@; do
				if [[ $file == $branch ]]; then
					continue
				fi
				echo git reset $b $file
				git reset $b $file
			done
			return
		fi
	done
}

function jtest() {
	npx jest --coverage=false $@
}
