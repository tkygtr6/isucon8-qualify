#!/bin/bash -xe

SERVER1_HOSTNAME=isucon-server1
SERVER2_HOSTNAME=isucon-server2
SERVER3_HOSTNAME=isucon-server3

echo "Deploying isucon-server3"
ssh -A $SERVER3_HOSTNAME "cd /home/isucon/torb && git pull"
ssh -A $SERVER3_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh isucon-server3"

echo "Deploying isucon-server2"
ssh -A $SERVER2_HOSTNAME "cd /home/isucon/torb && git pull"
ssh -A $SERVER2_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh isucon-server2"

echo "Deploying isucon-server1"
ssh -A $SERVER1_HOSTNAME "cd /home/isucon/torb && git pull"
ssh -A $SERVER1_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh isucon-server1"

