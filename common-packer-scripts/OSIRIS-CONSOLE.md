[vagrant@itg-iceberg osiris-console-4.2.3-release]$ sudo ./install.sh
Continue with installation? (y/n) [y]  y
Osiris Scanning Daemon Version 
4.2.3-release

"4.2.3-release" for Linux 3.10.0-1160.114.2.el7.x86_64
Copyright (c) 2006 Brian Wotring. All Rights Reserved.


This installation was configured and built to run as osiris
     agent user name: osiris
management user name: osiris

This installation was configured and built to use osiris
     agent root directory: /usr/local/osiris
management root directory: /usr/local/osiris

The username and directory will be created during the
installation process if they do not already exist.

By installing this product you agree that you have read the
LICENSE file and will comply with its terms. 

---------------------------------------------------------------------

==> creating user and group (osiris, osiris).
==> group 'osiris' added.
==> user 'osiris' added.
==> using existing Osiris management console user.
Install osiris agent? (y/n) [y]  y
Install management console? (y/n) [y]  y
Install CLI? (y/n) [y]  y
Installation directory for binaries: [/usr/local/sbin] 
==> installed osiris CLI: /usr/local/sbin/osiris
==> installed scan agent: /usr/local/sbin/osirisd
==> installed management console /usr/local/sbin/osirismd
==> installed default scan configs.
==> installing rc startup for daemon(s).
Linux Distribution: redhat
==> change owner and  permissions on /usr/local/sbin/osiris
-rwxr-xr-x. 1 root root 957672 Apr 16 05:30 /usr/local/sbin/osiris
==> change owner and permissions on /usr/local/sbin/osirisd
-rwxr-xr-x. 1 root root 150568 Apr 16 05:30 /usr/local/sbin/osirisd
==> change owner permissions on /usr/local/sbin/osirismd
-rwsr-xr-x. 1 osiris osiris 978728 Apr 16 05:30 /usr/local/sbin/osirismd

==================================================================
Osiris has been installed, but is not currently running.  Startup 
scripts have been installed so that the necessary services will 
be started on boot.

Start management console now? (y/n) [y]  n
 --> to start management console, run: /usr/local/sbin/osirismd
Start scan agent now? (y/n) [y]  n
 --> to start the scan agent, do sudo /usr/local/sbin/osirisd

Documentation is included with this source and available online at:
    http://www.hostintegrity.com/osiris


(c) 2006 - Brian Wotring

[vagrant@itg-iceberg osiris-console-4.2.3-release]$ 
