#!/bin/bash

cd /var/www/html

echo "Downloading Piwik..."

if [ ! -e piwik.php ]; then
	tar cf - --one-file-system -C /usr/src/piwik . | tar xf -
fi


kaigara render db_setup.sh > /db_setup.sh
chmod +x /db_setup.sh
/db_setup.sh

echo "Configuring Piwik..."

kaigara render setup.php > /setup.php
php /setup.php

chown -R www-data .
