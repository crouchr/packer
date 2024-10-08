#!/bin/bash -eux
echo "Installing Docker CE and tooling..."

# Install packages
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce
sudo yum install -y docker-ce-cli
sudo yum install -y containerd.io
sudo yum install -y docker-compose

# Allow vagrant user to run docker
sudo usermod -aG docker vagrant
sudo usermod -aG docker $(whoami)

# Allow use of unauthenticated access to my private Docker v2 Registry hostname registry
sudo mkdir -p /etc/docker
sudo cp /tmp/daemon.json /etc/docker/daemon.json
sudo cp /tmp/docker.service /usr/lib/systemd/system/docker.service

# Start Docker
sudo systemctl start docker

# Enable Docker
sudo systemctl enable docker

# Install Portainer : access via port 9000 with a web browser
# A step is needed at run time to run the container
sudo docker pull portainer/portainer

# Install cAdvisor : access via port 8080 with a web browser
# Ref : https://github.com/google/cadvisor
# A step is needed at run time to run the container
# CADVISOR_VERSION=v0.36.0
# sudo docker pull gcr.io/google-containers/cadvisor:$CADVISOR_VERSION
