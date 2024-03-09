#!/bin/bash -eux

echo "Installing Python 3.11..."

# Install Python 3.11
sudo mkdir -p /opt/python3
wget -q -P /tmp/ https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz
sudo tar xvf /tmp/Python-3.11.6.tgz -C /opt
cd /opt/Python-3.11.6
LDFLAGS="${LDFLAGS} -Wl,-rpath=/usr/local/openssl/lib" ./configure --with-openssl=/usr/local/openssl
sudo make altinstall
# /usr/local/bin/pip3.11 install --upgrade pip

# smoke test
# python3 --version
