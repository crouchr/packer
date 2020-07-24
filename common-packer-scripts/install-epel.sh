#!/bin/bash -eux
# This is used by honeypot so do NOT run yum update - want it unpatched

# Add the EPEL repo
#sudo yum install -y epel-release
# failing so temp disable epel and add it in Chef provisioning
#==> RCH_HPOT_VIRTUALBOX: Provisioning with shell script: /home/crouchr/PycharmProjects/packer/rch-centos7/../common-packer-scripts/reboot.sh
#    RCH_HPOT_VIRTUALBOX: reboot.sh : Reboot will take 60 seconds, please wait...
#==> RCH_HPOT_VIRTUALBOX: + echo 'reboot.sh : Reboot will take 60 seconds, please wait...'
#==> RCH_HPOT_VIRTUALBOX: + sudo reboot
#==> RCH_HPOT_VIRTUALBOX: Provisioning with shell script: /home/crouchr/PycharmProjects/packer/rch-centos7/../common-packer-scripts/install-tools-packages.sh
#==> RCH_HPOT_VIRTUALBOX: + sudo yum install -y yum-utils git wget lsof net-tools htop tcpdump traceroute tcpflow bind-utils
#    RCH_HPOT_VIRTUALBOX: Loaded plugins: fastestmirror
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:  One of the configured repositories failed (Unknown),
#==> RCH_HPOT_VIRTUALBOX:  and yum doesn't have enough cached data to continue. At this point the only
#==> RCH_HPOT_VIRTUALBOX:  safe thing yum can do is fail. There are a few ways to work "fix" this:
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:      1. Contact the upstream for the repository and get them to fix the problem.
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:      2. Reconfigure the baseurl/etc. for the repository, to point to a working
#==> RCH_HPOT_VIRTUALBOX:         upstream. This is most often useful if you are using a newer
#==> RCH_HPOT_VIRTUALBOX:         distribution release than is supported by the repository (and the
#==> RCH_HPOT_VIRTUALBOX:         packages for the previous distribution release still work).
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:      3. Disable the repository, so yum won't use it by default. Yum will then
#==> RCH_HPOT_VIRTUALBOX:         just ignore the repository until you permanently enable it again or use
#==> RCH_HPOT_VIRTUALBOX:         --enablerepo for temporary usage:
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:             yum-config-manager --disable <repoid>
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:      4. Configure the failing repository to be skipped, if it is unavailable.
#==> RCH_HPOT_VIRTUALBOX:         Note that yum will try to contact the repo. when it runs most commands,
#==> RCH_HPOT_VIRTUALBOX:         so will have to try and fail each time (and thus. yum will be be much
#==> RCH_HPOT_VIRTUALBOX:         slower). If it is a very temporary problem though, this is often a nice
#==> RCH_HPOT_VIRTUALBOX:         compromise:
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX:             yum-config-manager --save --setopt=<repoid>.skip_if_unavailable=true
#==> RCH_HPOT_VIRTUALBOX:
#==> RCH_HPOT_VIRTUALBOX: Cannot retrieve metalink for repository: epel/x86_64. Please verify its path and try again
