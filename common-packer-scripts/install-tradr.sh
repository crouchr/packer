#!/bin/bash -eux
# Pull initial version of TRADR Docker containers

echo "Installing latest version of TRADR application ..."

docker pull registry:5000/tradr-cli
docker pull registry:5000/tradr-scanner

echo "Finished installing latest version of TRADR application"
