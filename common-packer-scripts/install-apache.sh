#!/bin/bash -eux

echo "Installing Apache 2.4..."

# Apache, PHP and WAF for web front end
sudo yum install -y httpd httpd-devel mod_ssl
sudo yum install -y mod_security
sudo yum install -y dnsmasq bind-utils
sudo yum -y install php php-common php-mysql php-pdo php-intl php-gd php-xml php-mbstring
echo "date.timezone = Europe/London" >> /etc/php.ini
