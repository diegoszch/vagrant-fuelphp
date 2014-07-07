#!/usr/bin/env bash

rm -rf /var/www
ln -fs /vagrant/www /var/www

apt-get install -y apache2
a2enmod rewrite

HOSTNAME=$(cat <<EOF
localhost
EOF
)
echo "${HOSTNAME}" > /etc/hostname
