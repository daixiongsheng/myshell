#!/bin/bash

hosts=""
for i in `cat /etc/hosts`
do
    if [[ $i =~ [a-z]+[0-9]{3}\.com ]]
    then
        hosts="$hosts ${i%.com}"
    fi
done

function cphosts() {
    for i in $hosts;do
        scp -o ConnectTimeout=1 /etc/hosts root@"$i":/etc/hosts
    done
}

function shutdown() {
    for i in $hosts;do
        `ssh -o ConnectTimeout=1 root@$i 'shutdown now'`
    done
}

function reboot() {
    for i in $hosts;do
        ssh -o ConnectTimeout=1 root@$i 'reboot'
    done
}

function test() {
    ssh -o ConnectTimeout=1 root@rocketmq100 "$*"
}


function cmd() {
    echo "$*"
    for i in $hosts;do
        ssh -o ConnectTimeout=1 root@$i "$*"
    done
}

function update() {
    for i in $hosts;do
        ssh -o ConnectTimeout=1 root@$i "cd /root/myshell && git pull"
    done
}

function init() {
    cmd 'test -d /root/myshell && echo ok || (https_proxy=mac:9999 git clone https://github.com/daixiongsheng/myshell.git /root/myshell)'
    cmd "cat /root/.zshrc | grep -q base.sh && echo ok || sed -i 's/source \$ZSH\\/oh-my-zsh.sh/\\nif [ -f \$HOME\\/myshell\\/base.sh ]\\nthen\\n    source \$HOME\\/myshell\\/base.sh\\nfi\\nsource \$ZSH\\/oh-my-zsh.sh/g' /root/.zshrc"
}


if [[ "" == $1 ]];then
    echo "====================="
    echo "bash batch.sh cphosts"
    echo "bash batch.sh shutdown"
    echo "bash batch.sh reboot"
else
    $@
fi



