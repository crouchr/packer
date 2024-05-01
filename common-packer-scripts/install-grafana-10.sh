#!/bin/bash -eux
# This has the slightly more complicated time UI

echo "Installing Grafana v10.4.2 ..."

# https://www.fosslinux.com/8328/how-to-install-and-configure-grafana-on-centos-7.htm

# Grafana v10.x - not reliable - use Grafana 7.2 for now and plan a Grafana 10.x upgrade
# cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
# [grafana]
# name=grafana
# baseurl=https://packages.grafana.com/oss/rpm
# repo_gpgcheck=1
# enabled=1
# gpgcheck=1
# gpgkey=https://packages.grafana.com/gpg.key
# sslverify=1
# sslcacert=/etc/pki/tls/certs/ca-bundle.crt
# EOF

### NOT starting on installation, please execute the following statements to configure grafana to start automatically using systemd
# sudo /bin/systemctl daemon-reload
# sudo /bin/systemctl enable grafana-server.service
### You can start grafana-server by executing
# sudo /bin/systemctl start grafana-server.service

wget -q -O /tmp/grafana-10.4.2-1.x86_64.rpm http://192.168.1.4/centos7-packages/grafana-10.4.2-1.x86_64.rpm
sudo yum -y localinstall /tmp/grafana-10.4.2-1.x86_64.rpm
sudo mkdir -p /etc/grafana

# grafana.ini previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/grafana.ini /etc/grafana/grafana.ini

echo "Starting Grafana..."
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server.service
sudo systemctl start grafana-server.service
