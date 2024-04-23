#!/bin/bash -eux
# Install Snort
# https://upcloud.com/resources/tutorials/installing-snort-on-centos

echo "Installing Snort v2.9.6.1 ..."

wget -O /tmp/daq-2.0.2.tar.gz  http://192.168.1.4/source-code/daq-2.0.2.tar.gz
wget -O /tmp/snort-2.9.6.1.tar.gz http://192.168.1.4/source-code/snort-2.9.6.1.tar.gz


# cd /tmp     # BEWARE - a directory change !
# tar xfvz daq-2.0.2.tar.gz
# tar xvfz snort-2.9.6.1.tar.gz

# cd /tmp/daq-2.0.2
# sudo ./configure
# sudo .make
# sudo make install

# cd /tmp/snort-2.9.6.1
# sudo ./configure
# sudo .make
# sudo make install





# sudo yum install -y https://www.snort.org/downloads/snort/daq-2.0.6-1.centos7.x86_64.rpm
# sudo yum install -y https://www.snort.org/downloads/snort/snort-2.9.12-1.centos7.x86_64.rpm

# sudo ldconfig
# sudo ln -s /usr/local/bin/snort /usr/sbin/snort
# sudo groupadd snort
# sudo useradd snort -r -s /sbin/nologin -c SNORT_IDS -g snort
# sudo mkdir -p /etc/snort/rules
# sudo mkdir /var/log/snort
# sudo mkdir /usr/local/lib/snort_dynamicrules
# sudo chmod -R 5775 /etc/snort
# sudo chmod -R 5775 /var/log/snort
# sudo chmod -R 5775 /usr/local/lib/snort_dynamicrules
# sudo chown -R snort:snort /etc/snort
# sudo chown -R snort:snort /var/log/snort
# sudo chown -R snort:snort /usr/local/lib/snort_dynamicrules

# sudo touch /etc/snort/rules/white_list.rules
# sudo touch /etc/snort/rules/black_list.rules
# sudo touch /etc/snort/rules/local.rules

# Install Community rules
# sudo wget https://www.snort.org/rules/community -O ~/community.tar.gz
# sudo tar -xvf ~/community.tar.gz -C ~/
# sudo cp ~/community-rules/* /etc/snort/rules
# sudo sed -i 's/include $RULE_PATH/#include $RULE_PATH/' /etc/snort/snort.conf

# more to do here but see how far this gets
# smoke test
# sudo snort -T -c /etc/snort/snort.conf

echo "Installed Snort v2.9.6.1 ..."
