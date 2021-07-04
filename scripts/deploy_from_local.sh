#!/bin/bash -xe
echo "Deployoing server3"
ssh isucon8-3 /home/isucon/torb/scripts/deploy.sh server3
echo "Deployoing server2"
ssh isucon8-2 /home/isucon/torb/scripts/deploy.sh server2
echo "Deployoing server1"
ssh isucon8-1 /home/isucon/torb/scripts/deploy.sh server1
