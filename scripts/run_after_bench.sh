#!/bin/bash

SERVER1_HOSTNAME=isucon-server1
SERVER2_HOSTNAME=isucon-server2
SERVER3_HOSTNAME=isucon-server3

scp $SERVER1_HOSTNAME:/var/log/nginx/access.log logs/
ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mariadb/mysql-slow.sql > ~/.tmp/mysql-slow.sql"
scp $SERVER3_HOSTNAME:~/.tmp/mysql-slow.sql logs/
ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo cat /var/log/mariadb/mysql.log > ~/.tmp/mysql.log"
scp $SERVER3_HOSTNAME:~/.tmp/mysql.log logs/

#ssh $SERVER3_HOSTNAME "mkdir -p ~/.tmp; sudo pt-query-digest /var/log/mariadb/mysql-slow.sql > ~/.tmp/pt.result"

