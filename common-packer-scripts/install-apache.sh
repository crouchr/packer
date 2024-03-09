#!/bin/bash -eux

echo "Installing Apache 2.4..."

# Apache, PHP and WAF for web front end
yum install -y httpd httpd-devel mod_ssl
yum install -y mod_security
yum install -y dnsmasq bind-utils
yum -y install php php-common php-mysql php-pdo php-intl php-gd php-xml php-mbstring
echo "date.timezone = Europe/London" >> /etc/php.ini
