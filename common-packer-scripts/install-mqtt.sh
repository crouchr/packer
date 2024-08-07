#!/bin/bash -eux
# https://www.instructables.com/CentOS-7-As-MQTT-Server/
echo "Installing MQTT..."

sudo yum -y install mosquitto

echo "Starting MQTTd..."
sudo systemctl enable mosquitto
sudo systemctl start mosquitto

