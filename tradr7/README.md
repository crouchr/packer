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
1. install-tradr-shell.sh
2. create a add-user-foo.sh
3. Add the add-user-foo.sh to the tradr7-packer.json file (in alphabetical order)

