#!/bin/bash -eux

echo "Installing Apache 2.4, PHP, ModSSL and ModSecurity..."

# Apache, PHP and WAF for web front end
sudo yum install -y httpd httpd-devel mod_ssl
# sudo yum install -y mod_security
sudo yum install -y dnsmasq bind-utils lynx
sudo yum -y install php php-common php-mysql php-pdo php-intl php-gd php-xml php-mbstring

# php.ini previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/php.ini /etc/php.ini

# Currently causing a failure in Packer so commented out - only needed for Web-based UI
echo "Starting httpd..."
sudo systemctl enable httpd.service
sudo systemctl start httpd.service
