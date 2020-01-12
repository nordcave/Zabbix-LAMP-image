#!/bin/bash

variable1=$(
echo "CREATE DATABASE zabbixdb character set utf8 collate utf8_bin;
CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'alpaca';
GRANT ALL PRIVILEGES ON zabbixdb.* TO 'zabbix'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
" | mysql
)

# Load the Zabbix database schema to the MySQL database
cd /usr/share/zabbix-server-mysql
# connecting to MySQL with socket
zcat schema.sql.gz | mysql zabbixdb
zcat images.sql.gz | mysql zabbixdb
zcat data.sql.gz | mysql zabbixdb
# zcat schema.sql.gz | mysql -u zabbix -p zabbixdb

# Edit Zabbix configuration file.
sed -i '115 s/# DBPassword=/DBPassword=alpaca/' /etc/zabbix/zabbix_server.conf
sed -i '91 s/x/xdb/' /etc/zabbix/zabbix_server.conf
sed -i '79 s/# //' /etc/zabbix/zabbix_server.conf