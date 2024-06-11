#!/bin/bash

MEMORY_IN_MB=$(free -m | grep Mem: | awk '{print $2}')

SWAP_SIZE=$(($MEMORY_IN_MB * 2))

sudo fallocate -l ${SWAP_SIZE}M /swapfile

sudo chmod 600 /swapfile

sudo mkswap /swapfile

sudo swapon /swapfile

echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

