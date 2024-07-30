#!/usr/bin/env bash
set -o errexit -o nounset -o noglob -o pipefail

echo "_____ SCRIPT_NAME = centos7_scripts / update_packages _____"

### define the path to sudo binary
_SUDO=$(command -v sudo)

# Print the current repo configuration
"${_SUDO}" yum repolist
"${_SUDO}" cat /etc/yum.repos.d/CentOS-Base.repo

# Don't use mirrorlist, stopped working at EOL.
"${_SUDO}" sed -Ei 's|^(mirrorlist=http.*)|# \1|' /etc/yum.repos.d/CentOS-Base.repo
# Enable the baseurl
"${_SUDO}" sed -Ei 's|^#(baseurl=http.*)|\1|' /etc/yum.repos.d/CentOS-Base.repo
# Use the vault repos instead of the default.
"${_SUDO}" sed -Ei "s|^baseurl=http://mirror|baseurl=https://vault|" /etc/yum.repos.d/CentOS-Base.repo 

# Print the final repo configuration
"${_SUDO}" cat /etc/yum.repos.d/CentOS-Base.repo 

"${_SUDO}" yum clean all
"${_SUDO}" yum makecache
