#!/bin/bash

cd /var/www/html

echo "Downloading Piwik..."

if [ ! -e piwik.php ]; then
	tar cf - --one-file-system -C /usr/src/piwik . | tar xf -
fi


echo "Installing Piwik DB..."

until mysqladmin ping -uroot -pheliostech -hdb
do
  sleep 1
done

php /db.php

echo "Configuring Piwik..."
php /setup.php

chown -R www-data .
# touch config/config.ini.php
# chmod +w config/config.ini.php
# kaigara render config.php | tee config/config.ini.php
