#!/bin/bash -eux
# Upload the Box file to my own web-server - gave up on Vagrant Cloud

# Upload the Box file to Vagrant
# Note the vagrant-cloud plugin needs to be installed for the jenkins user (not root)
# jenkins $ vagrant plugin install vagrant-cloud

BOX_DIR=$1
BOX_VERSION=$2
BOX_DESCRIPTION=$3
# VAGRANT_CLOUD_TOKEN=$4

# Derived
BOX_NAME="${BOX_DIR}-v${BOX_VERSION}".box
# export VAGRANT_LOG="debug"
# export VAGRANT_LOG="info"

# export VAGRANT_SERVER_URL='https://app.vagrantup.com/'

# Static
# AWS_PROFILE="developmentaws"

# echo "AWS_PROFILE         : ${AWS_PROFILE}"
echo "BOX_DIR             : ${BOX_DIR}"
echo "BOX_NAME            : ${BOX_NAME}"
echo "BOX_VERSION         : ${BOX_VERSION}"
echo "BOX_DESCRIPTION     : ${BOX_DESCRIPTION}"
# echo "VAGRANT_CLOUD_TOKEN : ${VAGRANT_CLOUD_TOKEN}"

# rm ~/.vagrant.d/data/vagrant_login_token
# vagrant plugin install vagrant-cloud



#response=$(curl \
#  --request GET \
#  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
#  https://app.vagrantup.com/api/v2/box/crouchr/${BOX_NAME}/version/${BOX_VERSION}/provider/virtualbox/amd64/upload)

  # https://app.vagrantup.com/api/v2/box/myuser/test/version/1.2.3/provider/virtualbox/amd64/upload)

# Requires the jq command
# upload_path=$(echo "$response" | jq .upload_path)

#curl \
#  --request PUT \
#  --upload-file ${BOX_NAME} \
#  "${upload_path}"
#upload_path='http://192.168.1.4/boxes/tradr/'
#
#curl \
#  --request PUT \
#  --upload-file ${BOX_NAME} \
#  "${upload_path}"

sudo cp --force ${BOX_NAME} /var/www/htdocs/boxes/tradr7/${BOX_NAME}
sudo cp --force ${BOX_DIR}-metadata.json /var/www/htdocs/boxes/tradr7/${BOX_DIR}-metadata.json

# Login
# vagrant cloud auth login ${VAGRANT_CLOUD_TOKEN}
# vagrant cloud auth login --token ${VAGRANT_CLOUD_TOKEN}
# vagrant login --token ${VAGRANT_CLOUD_TOKEN}

# Display some basic information
# vagrant cloud auth whoami ${VAGRANT_CLOUD_TOKEN}

# Push the file to Vagrant Cloud
#vagrant \
#cloud publish \
#--description "${BOX_DESCRIPTION}" \
#--short-description "${BOX_DESCRIPTION}" \
#--force \
#--release \
#--box-version ${BOX_VERSION} \
#crouchr/${BOX_DIR} ${BOX_VERSION} virtualbox ${BOX_NAME}


# Set variables
#BOX_NAME="tradr7"
#BOX_FILE="/home/crouchr/Downloads/tradr7-v1.0.54.box"
#VERSION="1.0.54"  # Version number
#USERNAME="crouchr"

# Authenticate with Vagrant Cloud
# vagrant cloud auth login --username ${USERNAME} --token ${TOKEN}

# Create a new version
#vagrant cloud version create $USERNAME/$BOX_NAME $VERSION

# Add the box file to the version
#vagrant cloud box add $USERNAME/$BOX_NAME $VERSION --box-file $BOX_FILE

# Release the version
#vagrant cloud publish $USERNAME/$BOX_NAME $VERSION --release

# echo "Box $BOX_NAME version $VERSION uploaded successfully to Vagrant Cloud."


# This is now done using S3 plugin
#echo
#echo "Upload the CentOS7 Vagrant box to my NVM S3 bucket"
#echo "--------------------------------------------------"
#echo "Note : This may take several minutes..."
#aws s3 --profile=${AWS_PROFILE} \
#cp boxes/${BOX_DIR}/${BOX_VERSION}/virtualbox/${BOX_NAME} s3://richardcrouch/boxes/${BOX_NAME}


