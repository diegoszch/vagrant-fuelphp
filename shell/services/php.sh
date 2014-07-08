#!/usr/bin/env bash

apt-get install -y php5 php5-cli php5-mysql phpunit php-apc php5-imagick php5-gd
apt-get install -y curl imagemagick php5-dev php5-curl 
pt-get install -y libapache2-mod-php5 apache2
apt-get install -y php5-xdebug php5-memcache php5-suhosin php5-mcryptphp-pear build-essential
apt-get install -y php-pear php5-xsl

echo '[Instalando PHPUnit e PHPDocumentor]'
pear channel-update pear.php.net
pear upgrade-all
pear config-set auto_discover 1
pear install pear.phpunit.de/PHPUnit
pear channel-discover pear.phpdoc.org
pear install phpdoc/phpDocumentor

echo '[Instalando Composer...]'
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/

echo '[Instalando FuelPHP]'
curl get.fuelphp.com/oil | sh