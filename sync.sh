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
		git push origin $git_current_branch
	else
		git pull
	fi
}

git_current_branch() {
	local ref
	ref=$(git symbolic-ref --quiet HEAD 2>/dev/null)
	local ret=$?
	if [[ $ret != 0 ]]; then
		[[ $ret == 128 ]] && return
		ref=$(git rev-parse --short HEAD 2>/dev/null) || return
	fi
	echo ${ref#refs/heads/}
}

dirs=(
	$HOME/myshell
	$HOME/.config/tmux
	$HOME/.config/nvim
	$HOME/.config/yabai
)

for dir in ${dirs[@]}; do
	sync $dir
done
