#!/bin/bash

cd $HOME/myshell

if [[ "" != `git status --short` ]]
then
	git pull
	git config user.email daixiongsheng@gmail.com
	git add .
	date=$(date "+%Y-%m-%d-%H:%M:%S")
	echo $date $1
	git commit -m "$date $1"
	git push origin master
fi