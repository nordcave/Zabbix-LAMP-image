#!/bin/bash
set -e
set -x

# Set directory for MySQL & start service.
usermod -d /var/lib/mysql/ mysql
service mysql start

# Set requred parameters in php configuration file.
sed -i '936 s#;date\.timezone =#date\.timezone = 'Europe/Kiev'#' /etc/php/7.2/apache2/php.ini
sed -i '669 s/8/16/' /etc/php/7.2/apache2/php.ini
sed -i '380 s/30/300/' /etc/php/7.2/apache2/php.ini
sed -i '390 s/60/300/' /etc/php/7.2/apache2/php.ini

# Point Zabbix path in Apache configuration.
sed -i 's#/var/www/html#/usr/share/zabbix#' /etc/apache2/sites-available/000-default.conf
sed -i 's#/var/www/html#/usr/share/zabbix#' /etc/apache2/sites-available/default-ssl.conf

# Configure MySQL DB for Zabbix.
/bin/sh -c /server_build/zabbix-db-init.sh

# Finally, lauch services
service apache2 restart
service zabbix-server restart

# To terminal remain active after 'docker run'.
/bin/bash