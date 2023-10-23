#/bin/bash
set -e

echo 'Run smoke checks on critical installed applications...'

gcc --version
go version

docker --version

chef-client --version

clamscan --version
sec -version
nmap --version
