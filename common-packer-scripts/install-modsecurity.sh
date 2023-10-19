#!/usr/bin/env bash
# FIXME - need to add the CRS rules
echo "Installing mod_security..."

sudo yum install -y httpd httpd-devel mod_ssl
sudo yum install -y mod_security mod_proxy
