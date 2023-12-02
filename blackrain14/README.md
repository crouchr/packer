This repo contains the scripts required to build the base Blackrain Slackware 14.2 Vagrant Box

This Box is essentially an appliance and so needs every piece of unused Slackware package removed

This Box is then uses with other jobs to then configure the Box as a full implementation.

Note : This box is defined in the legacy JSON format

The step in the packer file where the Slackware package sets is defined is shown below ?:
"<wait>e
<spacebar>f
<spacebar>kk
<spacebar>t
<spacebar>t
<spacebar>x
<spacebar>x
<spacebar>x
<spacebar>y
<spacebar><enter>",


Packages will have been built on another Slackware node - called blackrain-builder (a VirtualBox)
