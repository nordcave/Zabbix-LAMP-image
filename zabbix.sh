#!/bin/bash
set -e
source /server_build/prepare
set -x

# Configure Zabbix package repository for Ubuntu 18.04.
wget https://repo.zabbix.com/zabbix/4.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.0-3+bionic_all.deb
dpkg -i zabbix-release_4.0-3+bionic_all.deb
# apt-get update

# Install Zabbix (MySQL support + web interface + agent).
$minimal_apt_get_install zabbix-server-mysql \
                         zabbix-frontend-php \
                         zabbix-agent
