#!/usr/bin/env bash

for i in $(ls /vagrant/shell/vhosts/*.sh);
do
   sh $i
done
