#!/bin/bash -eux
# Install Elastic Filebeats on node - Chef will be used to configure it

echo "Installing Elastic Filebeats..."

curl -L -O http://192.168.1.4/centos7-packages/filebeat-oss-7.9.2-x86_64.rpm
sudo yum localinstall -y filebeat-oss-7.9.2-x86_64.rpm

