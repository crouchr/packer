#!/bin/bash -eux

echo "Installing Grafana v7.2.2 ..."

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

wget -O /tmp/grafana-7.2.2-1.x86_64.rpm http://192.168.1.4/centos7-packages/grafana-7.2.2-1.x86_64.rpm
sudo yum -y localinstall /tmp/grafana-7.2.2-1.x86_64.rpm
sudo mkdir -p /etc/grafana

# grafana.ini previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/grafana.ini /etc/grafana/grafana.ini

# FIXME : Start Grafana in the Vagrant file - not sure why won't run at this point...
echo "Starting Grafana..."
sudo systemctl enable grafana-server

# sudo systemctl start grafana-server
