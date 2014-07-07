#!/usr/bin/env bash

echo 'VHOST fuelphp.test'
 
VHOST=$(cat <<EOF
<VirtualHost *:80> 

    ServerName fuelphp.test
    DocumentRoot "/var/www/fuelphp.test/public"
        
    # This should be omitted in the production environment
    SetEnv APPLICATION_ENV development

    ErrorLog /var/log/apache2/error-fuelphp.test.log
    LogLevel warn

    <Directory "/var/www/fuelphp.test/public">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride All 
        Order allow,deny
        Allow from all
    </Directory>

</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/fuelphp.test

ln -s /etc/apache2/sites-available/fuelphp.test /etc/apache2/sites-enabled/fuelphp.test 

HOSTS=$(cat <<EOF
127.0.0.1   fuelphp.test
EOF
)
echo "${HOSTS}" >> /etc/hosts

cd /var/www
oil create fuelphp.test