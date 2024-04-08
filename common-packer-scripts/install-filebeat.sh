#!/bin/bash -eux
# Install Elastic Filebeat on node - Chef will be used to configure it

echo "Installing Elastic Filebeat..."

curl -L -O http://192.168.1.4/centos7-packages/filebeat-oss-7.9.2-x86_64.rpm
sudo yum localinstall -y filebeat-oss-7.9.2-x86_64.rpm

echo "The following filebeat modules are available..."
sudo filebeat modules list

