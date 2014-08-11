#!/usr/bin/env bash

apt-get install -y php5 php5-cli php5-dev php5-mysql phpunit php-apc php5-imagick php5-gd
apt-get install -y curl imagemagick php5-curl 
apt-get install -y libapache2-mod-php5
apt-get install -y php5-memcache php5-mcryptphp-pear
apt-get install -y php-pear php5-xsl

echo '[Installing and Setting XDebug]'
apt-get install -y php5-xdebug 
XDEBUG=$(cat <<EOF
xdebug.default_enable = 1
xdebug.remote_enable = 1
xdebug.remote_handler =dbgp
xdebug.remote_host = 192.168.33.1
xdebug.remote_port = 9000
xdebug.remote_log = /tmp/php5-xdebug.log
EOF
)
echo "${XDEBUG}" >> '/etc/php5/conf.d/xdebug.ini'

echo '[Installing PHPUnit and PHPDocumentor]'
pear channel-update pear.php.net
pear upgrade-all
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear channel-discover pear.phpdoc.org
pear install phpdoc/phpDocumentor

echo '[Installing Composer...]'
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/

#echo '[Installing Bower]'
#sudo apt-get install -y python-software-properties
#add-apt-repository -y ppa:chris-lea/node.js
#apt-get -y update
#apt-get -y install nodejs
#npm install -g bower

#apt-get install -y npm



echo '[Installing FuelPHP]'
curl get.fuelphp.com/oil | sh