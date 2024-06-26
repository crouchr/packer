#!/bin/bash -eux
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-centos-7
# Just install the software - do not start it up - do that in the Vagrantfile
set -e	# bomb out if any problem

echo
echo "Started setup.sh for provisioning ELK 7.9 on this node"

sudo mkdir -p /etc/logstash/conf.d
sudo mkdir -p /etc/elasticsearch
sudo mkdir -p /etc/kibana

# ELK
wget -O /tmp/elasticsearch-oss-7.9.2-x86_64.rpm http://192.168.1.4/centos7-packages/elasticsearch-oss-7.9.2-x86_64.rpm
wget -O /tmp/logstash-oss-7.9.2.rpm http://192.168.1.4/centos7-packages/logstash-oss-7.9.2.rpm
wget -O /tmp/kibana-oss-7.9.2-x86_64.rpm http://192.168.1.4/centos7-packages/kibana-oss-7.9.2-x86_64.rpm

sudo yum -y localinstall /tmp/elasticsearch-oss-7.9.2-x86_64.rpm
sudo yum -y localinstall /tmp/logstash-oss-7.9.2.rpm
sudo yum -y localinstall /tmp/kibana-oss-7.9.2-x86_64.rpm

echo 'Copy ELK configuration files...'
# cp /vagrant/config/ip_to_honeypot_name_mapping.csv /tmp/
sudo cp /tmp/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
# sudo cp /tmp/logstash-syslog.conf /etc/logstash/conf.d/logstash-syslog.conf
sudo cp /tmp/logstash-json.conf /etc/logstash/conf.d/logstash-json.conf
sudo cp /tmp/logstash.service /etc/systemd/system/logstash.service
sudo cp /tmp/kibana.yml /etc/kibana/kibana.yml

# Create the kibana log file to be used by syslog-ng
sudo touch /var/log/kibana.log

# Telegraf
#wget https://dl.influxdata.com/telegraf/releases/telegraf-1.8.3-1.x86_64.rpm
#yum -y localinstall telegraf-1.8.3-1.x86_64.rpm
#cp /vagrant/telegraf.conf /etc/telegraf/telegraf.conf

# Start in the Vagrant file
echo "Enable ELK services..."
sudo /bin/systemctl daemon-reload
sudo systemctl enable kibana.service
sudo systemctl enable elasticsearch.service
sudo systemctl enable logstash.service

echo "Start ELK services..."
sudo systemctl start elasticsearch.service
sudo systemctl start logstash.service
sudo systemctl start kibana.service

# echo "Display the elastic indices..."
curl localhost:9200/_cat/indices?v

echo "Finished setup.sh OK for provisioning ELK 7.9 on this node"
echo
