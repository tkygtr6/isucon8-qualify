#!/bin/bash
set -xe

function clean_log() {
	log_path=$1
	if [ -f $log_path ]; then
		sudo mv $log_path $log_path.$(date "+%Y%m%d_%H%M%S")
	fi
}

cd /home/isucon/torb
git pull

if [ $1 == "server1" ]; then
	clean_log /var/log/nginx/access.log
	sudo nginx -s stop
	sudo nginx
fi

if [ $1 == "server2" ]; then
	sudo systemctl restart torb.python
fi

if [ $1 == "server3" ]; then
	clean_log /var/log/mariadb/mysql.log
	clean_log /var/log/mariadb/mysql-slow.sql
	sudo systemctl restart mariadb
fi

