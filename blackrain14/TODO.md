# TODO.md
Make this (and all my boxes) build with the latest packer (1.9) - this is a legacy format (.json)


```commandline
[crouchr@dolphin blackrain14]$ /usr/bin/bash /home/crouchr/PycharmProjects/packer/blackrain14/go_build_box.sh
Entered go_build_box.sh
Warning: Bundled plugins used

This template relies on the use of plugins bundled into the Packer binary.
The practice of bundling external plugins into Packer will be removed in an
upcoming version.

To remove this warning and ensure builds keep working you can install these
external plugins with the 'packer plugins install' command

* packer plugins install github.com/hashicorp/virtualbox
* packer plugins install github.com/hashicorp/vagrant

Alternatively, if you upgrade your templates to HCL2, you can use 'packer init'
with a 'required_plugins' block to automatically install external plugins.

You can try HCL2 by running 'packer hcl2_upgrade
/home/crouchr/PycharmProjects/packer/blackrain14/blackrain14.json'

```