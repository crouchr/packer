Dedicated VBOX for TRADR system
- Used for both full system as well as Iceberg



TODO
- Update to latest 7.x versions once all working



tradr7-services
- I removed osiris console as it had inatsll issues
        # "{{template_dir}}/../common-packer-scripts/install-filebeat.sh",
        # "{{template_dir}}/../common-packer-scripts/install-wazuh-local.sh",
        "{{template_dir}}/../common-packer-scripts/install-osiris-console.sh",
        # "{{template_dir}}/../common-packer-scripts/install-chef-workstation.sh",
        # "{{template_dir}}/../common-packer-scripts/install-java-11.sh",

NOTES:
To add a new user you need to modify 3 files 

