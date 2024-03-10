#!/bin/bash -eux

echo "Installing Python 3.9.17 ..."

# Install Python 3.9.17
sudo rm -rf /opt/python3
sudo mkdir -p /opt/python3
wget -q -P /tmp/ https://www.python.org/ftp/python/3.9.17/Python-3.9.17.tgz
sudo tar xvf /tmp/Python-3.9.17.tgz -C /opt
cd /opt/Python-3.9.17
LDFLAGS="${LDFLAGS} -Wl,-rpath=/usr/local/openssl/lib" ./configure --with-openssl=/usr/local/openssl
sudo make altinstall
# /usr/local/bin/pip3.11 install --upgrade pip

# smoke test
# python3 --version
