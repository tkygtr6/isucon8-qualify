#!/bin/bash -xe

SERVER1_HOSTNAME=isucon8-1
SERVER2_HOSTNAME=isucon8-2
SERVER3_HOSTNAME=isucon8-3

echo "Deploying server3"
ssh $SERVER3_HOSTNAME "cd /home/isucon/torb && git pull"
ssh $SERVER3_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh server3"

echo "Deploying server2"
ssh $SERVER2_HOSTNAME "cd /home/isucon/torb && git pull"
ssh $SERVER2_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh server2"

echo "Deploying server1"
ssh $SERVER1_HOSTNAME "cd /home/isucon/torb && git pull"
ssh $SERVER1_HOSTNAME "sudo /home/isucon/torb/scripts/deploy.sh server1"

