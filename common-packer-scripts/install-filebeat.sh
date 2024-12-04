#!/bin/bash -eux
# Install Elastic Filebeat on node - Chef will be used to configure it
# see - https://www.server-world.info/en/note?os=CentOS_7&p=elasticstack7&f=7

echo "Installing Elastic Filebeat..."

wget -O /tmp/filebeat-oss-7.9.2-x86_64.rpm http://192.168.1.4/centos7-packages/filebeat-oss-7.9.2-x86_64.rpm
sudo yum localinstall -y /tmp/filebeat-oss-7.9.2-x86_64.rpm

# fails for some reason so ignore for now
#sudo cp /tmp/filebeat.yml /etc/filebeat/filebeat.yml

# FIXME : bug means start it during Vagrant provision - not true ?
#echo "Start Filebeat service..."
#sudo /bin/systemctl daemon-reload
#sudo systemctl start filebeat

#echo "The following Filebeat modules are available..."
#sudo filebeat modules list

echo "Installed Elastic Filebeat."
