#!/bin/bash
# Configure terminal output + set the apt-get command as variable.
set -e
source /server_build/prebuildconfig
set -x

# Fix "..policy-rc.d denied execution of start." issue. See https://bit.ly/36SG4Xj
printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

# Install HTTPS support for APT.
$minimal_apt_get_install apt-transport-https ca-certificates

# Install additional minor apps.
$minimal_apt_get_install apt-utils \
                         sed \
                         wget \
                         vim

# Fix "Geografical Area" issue.
mkdir -p /etc/container_environment
$minimal_apt_get_install language-pack-en
locale-gen en_US
update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
echo -n en_US.UTF-8 > /etc/container_environment/LANG
echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE