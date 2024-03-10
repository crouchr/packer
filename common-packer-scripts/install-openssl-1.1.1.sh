#!/bin/bash -eux
# https://gist.github.com/Bill-tran/5e2ab062a9028bf693c934146249e68c
echo "Installing OpenSSL v1.1.1 ..."

sudo yum install -y make gcc perl-core pcre-devel wget zlib-devel
wget -q -P /tmp/ https://ftp.openssl.org/source/openssl-1.1.1k.tar.gz
cd /tmp
tar -xzvf openssl-1.1.1k.tar.gz
cd openssl-1.1.1k
./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic
make
sudo make install
sudo cp /tmp/openssl.sh /etc/profile.d/openssl.sh
source /etc/profile.d/openssl.sh
openssl version

#sudo echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64" >> /etc/profile.d/openssl.sh