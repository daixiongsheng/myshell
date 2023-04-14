#!/bin/bash

function sync() {
	cd $1
	if [[ "" != $(git status --short) ]]; then
		git config user.email daixiongsheng@gmail.com
		git add .
		date=$(date "+%Y-%m-%d-%H:%M:%S")
		echo $date $1
		git commit -m "$date $1"
		git pull
		git push origin master
	fi
}

dirs=(
	$HOME/myshell
	$XDG_CONFIG_HOME/tmux
	$XDG_CONFIG_HOME/nvim
	$XDG_CONFIG_HOME/yabai
)

for dir in ${dirs[@]}; do
	sync $dir
done
