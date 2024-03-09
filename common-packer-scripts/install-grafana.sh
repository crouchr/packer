#!/bin/bash -eux

echo "Installing Grafana..."

# https://www.fosslinux.com/8328/how-to-install-and-configure-grafana-on-centos-7.htm

# Grafana v10.x
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
yum -y install grafana
mkdir -p /etc/grafana

#cp /vagrant/config/grafana.ini /etc/grafana/grafana.ini


