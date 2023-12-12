#!/bin/bash -eux
# Install Snort
# https://upcloud.com/resources/tutorials/installing-snort-on-centos

echo "Installing Snort..."

sudo yum install -y https://www.snort.org/downloads/snort/daq-2.0.6-1.centos7.x86_64.rpm
sudo yum install -y https://www.snort.org/downloads/snort/snort-2.9.12-1.centos7.x86_64.rpm

sudo ldconfig
sudo ln -s /usr/local/bin/snort /usr/sbin/snort
sudo groupadd snort
sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
sudo mkdir -p /etc/snort/rules
sudo mkdir /var/log/snort
sudo mkdir /usr/local/lib/snort_dynamicrules
sudo chmod -R 5775 /etc/snort
sudo chmod -R 5775 /var/log/snort
sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
sudo chown -R snort:snort /etc/snort
sudo chown -R snort:snort /var/log/snort
sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules

sudo touch /etc/snort/rules/white_list.rules
sudo touch /etc/snort/rules/black_list.rules
sudo touch /etc/snort/rules/local.rules

# install Community rules
sudo wget https://www.snort.org/rules/community -O ~/community.tar.gz
sudo tar -xvf ~/community.tar.gz -C ~/
sudo cp ~/community-rules/* /etc/snort/rules
sudo sed -i 's/include $RULE_PATH/#include $RULE_PATH/' /etc/snort/snort.conf

# more to do here but see how far this gets
# smoke test
# sudo snort -T -c /etc/snort/snort.conf
