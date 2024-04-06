#!/bin/bash -eux

echo "Installing SEC Event Correlator..."

# This is now stored on 192.168.1.4/centos7-packages
sudo wget --no-check-certificate \
   https://kojipkgs.fedoraproject.org//packages/sec/2.9.2/1.el7/noarch/sec-2.9.2-1.el7.noarch.rpm \

sudo yum -y install sec-2.9.2-1.el7.noarch.rpm
