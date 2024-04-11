#!/bin/bash -eux
# client, server and C connector

echo "Installing MariaDB SQL Database System v10.4 ..."

sudo echo -e "[mariadb]\nname=MariaDB Repository\nbaseurl=http://yum.mariadb.org/10.4/centos7-amd64\ngpgcheck=1\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" | sudo tee /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.4
sudo yum -y install MariaDB-server MariaDB-client MariaDB-devel

# Copy configuration files across
sudo cp /tmp/client.cnf /etc/mycnf.d/client.cnf
sudo cp /tmp/server.cnf /etc/mycnf.d/server.cnf

echo "Starting MariaDB..."
sudo systemctl enable mariadb
sudo systemctl start mariadb

echo "Finished installing MariaDB SQL Database System v10.4"