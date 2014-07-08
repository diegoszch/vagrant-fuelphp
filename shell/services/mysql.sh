#!/usr/bin/env bash

DIR=${1} 

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get install -y mysql-server

echo '[Habilitando acesso remoto MySQL]'
sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/my.cnf 
sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf

mysql --user=root --password=root --host=localhost --port=3306 < $DIR/mysql_bootstrap.sql
