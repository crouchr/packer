#!/bin/bash -eux
# https://www.instructables.com/CentOS-7-As-MQTT-Server/
echo "Installing MQTT..."

sudo yum -y install mosquito

echo "Starting MQTTd..."
sudo systemctl enable mosquito
sudo systemctl start mosquito

