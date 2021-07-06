#!/bin/bash
set -xe

function clean_log() {
	log_path=$1
	if [ -f $log_path ]; then
		mv $log_path $log_path.$(date "+%Y%m%d_%H%M%S")
	fi
}

cd /home/isucon/torb
git pull

if [ $1 == "isucon-server1" ]; then
	clean_log /var/log/nginx/access.log
	nginx -s stop && sleep 1 && nginx
fi

if [ $1 == "isucon-server2" ]; then
	sudo systemctl restart torb.python
fi

if [ $1 == "isucon-server3" ]; then
	clean_log /var/log/mariadb/mysql.log
	clean_log /var/log/mariadb/mysql-slow.sql
	systemctl restart mariadb
fi

