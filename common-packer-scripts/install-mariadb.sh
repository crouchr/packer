#!/bin/bash -eux
# client, server and C connector

echo "Installing MariaDB SQL Database System..."

sudo echo -e "[mariadb]\nname=MariaDB Repository\nbaseurl=http://yum.mariadb.org/10.4/centos7-amd64\ngpgcheck=1\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" | sudo tee /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.x
sudo yum -y install MariaDB-server MariaDB-client MariaDB-devel
#echo "Starting MariaDB..."
#systemctl enable mariadb
#systemctl start mariadb