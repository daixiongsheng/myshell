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

if [[ "" == $1 ]];then
    echo "====================="
    echo "bash batch.sh cphosts"
    echo "bash batch.sh shutdown"
    echo "bash batch.sh reboot"
else
    for c in "$@";do
        echo "$c"
        $c
    done
fi
