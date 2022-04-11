#!/bin/bash

cd $HOME/myshell

if [[ "" != `git status --short` ]]
then
	git config user.email daixiongsheng@gmail.com
	git add .
	date=$(date "+%Y-%m-%d-%H:%M:%S")
	echo $date $1
	git commit -m "$date $1"
	git pull
	git push origin master
fi
