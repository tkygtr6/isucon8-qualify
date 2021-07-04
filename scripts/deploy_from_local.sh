#!/bin/bash -xe
echo "Deploying server3"
ssh isucon8-3 "cd /home/isucon/torb && git pull"
ssh isucon8-3 /home/isucon/torb/scripts/deploy.sh server3

echo "Deploying server2"
ssh isucon8-2 "cd /home/isucon/torb && git pull"
ssh isucon8-2 /home/isucon/torb/scripts/deploy.sh server2

echo "Deploying server1"
ssh isucon8-1 "cd /home/isucon/torb && git pull"
ssh isucon8-1 /home/isucon/torb/scripts/deploy.sh server1
