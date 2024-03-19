#!/bin/bash -eux

echo "Installing Python 3.9.17 ..."

# Uninstall inbuilt Python 3.6 ?

# Install Python 3.9.17
sudo rm -rf /opt/python3
sudo mkdir -p /opt/python3
wget -q -P /tmp/ https://www.python.org/ftp/python/3.9.17/Python-3.9.17.tgz
sudo tar xvf /tmp/Python-3.9.17.tgz -C /opt

cd /opt/Python-3.9.17
LDFLAGS="-Wl,-rpath=/usr/include/openssl" ./configure --enable-optimizations
sudo make altinstall

# smoke test
python3.9 --version

# override built-in Python3
sudo ln -s /usr/local/bin/python3.9 /bin/python3 -f
python3 --version

#LDFLAGS="-Wl,-rpath=/usr/local/openssl/lib" ./configure --with-openssl=/usr/local/openssl --enable-optimizations
#LDFLAGS="-Wl,-rpath=/usr/lib64/opensslocal/openssl/lib" ./configure --enable-optimizations
# /usr/local/bin/pip3.11 install --upgrade pip
