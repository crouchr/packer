#!/bin/bash -eux
# client, server and C connector

echo "Installing MariaDB SQL Database System v10.4 ..."

sudo echo -e "[mariadb]\nname=MariaDB Repository\nbaseurl=http://yum.mariadb.org/10.4/centos7-amd64\ngpgcheck=1\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB" | sudo tee /etc/yum.repos.d/MariaDB.repo

# MariaDB 10.4
sudo yum -y install MariaDB-server MariaDB-client MariaDB-devel

# Copy configuration files across
sudo cp /tmp/client.cnf /etc/my.cnf.d/client.cnf
sudo cp /tmp/server.cnf /etc/my.cnf.d/server.cnf

echo "Starting MariaDB..."
sudo systemctl enable mariadb
sudo systemctl start mariadb

# An expect script is used to perform a basic installation
sudo cp /tmp/configure-mariadb.exp /home/vagrant/configure-mariadb.exp
sudo chmod +x /home/vagrant/configure-mariadb.exp
sudo chown vagrant:vagrant /home/vagrant/configure-mariadb.exp

echo "Finished installing MariaDB SQL Database System v10.4"
