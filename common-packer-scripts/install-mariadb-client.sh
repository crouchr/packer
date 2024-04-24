#!/bin/bash -eux
# client

echo "Installing MariaDB Client ..."

sudo echo -e "[mariadb]\nname=MariaDB Repository\nbaseurl=http://yum.mariadb.org/10.4/centos7-amd64\ngpgcheck=1\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" | sudo tee /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.4
sudo yum -y install MariaDB-client

echo "Finished installing MariaDB Client"
