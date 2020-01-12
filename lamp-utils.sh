#!/bin/bash
set -e
source /server_build/prepare
set -x

# Install Apache.
$minimal_apt_get_install apache2 \
                         libapache2-mod-php

# Install MySQL.
$minimal_apt_get_install mysql-server

# Install PHP.
$minimal_apt_get_install php \
                         php-mbstring \
                         php-gd php-xml \
                         php-bcmath \
                         php-ldap \
                         php-mysql
