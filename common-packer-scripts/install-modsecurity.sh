#!/usr/bin/env bash
# FIXME - need to add the CRS rules
# https://www.rosehosting.com/blog/install-mod_security-with-the-owasp-core-rule-set-on-a-centos-vps/
echo "Installing mod_security v2.9.7 from source..."
sudo yum -y install gcc make httpd-devel libxml2 pcre-devel libxml2-devel curl-devel git

wget -O /tmp/modsecurity-2.9.7.tar.gz http://192.168.1.4/source-code/modsecurity-2.9.7.tar.gz
cd /tmp     # BEWARE - a directory change !
sudo tar xfvz modsecurity-2.9.7.tar.gz
cd modsecurity-2.9.7
./configure
make
sudo make install

# cp modsecurity.conf-recommended /etc/httpd/conf.d/modsecurity.conf
# cp unicode.mapping /etc/httpd/conf.d/

# cd modsecurity-2.9.7
# sudo yum install -y httpd httpd-devel mod_ssl
# sudo yum install -y mod_security mod_proxy
