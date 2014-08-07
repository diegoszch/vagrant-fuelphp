#!/usr/bin/env bash

# Setting variables
DIR="/vagrant/shell" 
DIR_SERVICES=$DIR"/services"
DIR_CMD=$DIR"/cmd"

echo '[Updating Ubuntu Server]'
apt-get update

echo '[Preparing Envoriment]'
bash $DIR_SERVICES"/common.sh"

echo '[Installing Apache]'
bash $DIR_SERVICES"/apache.sh"

echo '[Installing PHP]'
bash $DIR_SERVICES"/php.sh"

echo '[Setting VHOSTS]'
bash $DIR_CMD"/addhost.sh" fuelphp.test

echo '[Installing MySQL]'
bash $DIR_SERVICES"/mysql.sh" $DIR_SERVICES

echo '[Restarting the services]'
bash $DIR_SERVICES"/restart.sh"
