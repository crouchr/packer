#/bin/bash
set -e

echo 'Run smoke checks on critical installed applications...'

docker --version
chef-client --version

clamscan --version
sec -version

go version

nmap --version