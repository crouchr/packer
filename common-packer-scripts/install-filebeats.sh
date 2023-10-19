#!/bin/bash -eux
# Install Elastic Filebeats on node - Chef will be used to configure it

echo "Installing Elastic Filebeats..."

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.17.14-x86_64.rpm
sudo rpm -vi filebeat-7.17.14-x86_64.rpm

