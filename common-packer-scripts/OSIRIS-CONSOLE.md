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



Configuration steps
===================
[vagrant@itg-services tmp]$ osiris
Osiris Shell Interface - version 4.2.3-release
 >>> authenticating to (127.0.0.1)

User: admin
Password: 

connected to management console, code version (4.2.3-release).
hello.

WARNING: your password is empty, use the 'passwd' command
to set your password.

osiris-4.2.3-release: passwd admin
Password: 
 >>> user: (admin) updated.
current login was edited, you must re-authenticate.
 >>> authenticating to (127.0.0.1)

Password: 

connected to management console, code version (4.2.3-release).
hello.

osiris-4.2.3-release: edit-mhost

[ edit management host (127.0.0.1) ]

  > syslog facility [DAEMON]: 
  > control port [2266]: 
  > http control port [0]: 
  > notify email (default for hosts) []: 
  > notification smtp host [127.0.0.1]: 
  > notification smtp port [25]: 

  > authorized hosts:

   127.0.0.1

  Modify authorization list (y/n)? [n] y

    s) show current listing.
    a) add a new authorized host.
    r) remove authorized host.
    q) quit

    > a
    > authorized hostname/IP (*=wildcard): 192.168.1.191

    s) show current listing.
    a) add a new authorized host.
    r) remove authorized host.
    q) quit

    > q

[ management config (127.0.0.1) ]

syslog_facility = DAEMON
control_port = 2266
http_port = 0
http_host = 
notify_email = 
notify_app = 
notify_smtp_host = 127.0.0.1
notify_smtp_port = 25
hosts_directory = 
allow = 127.0.0.1
allow = 192.168.1.191


Is this correct (y/n)? y
 >>> management host configuration has been saved.
osiris-4.2.3-release: mhost-config

[ management config (127.0.0.1) ]

syslog_facility = DAEMON
control_port = 2266
http_port = 0
http_host =
notify_email =
notify_app =
notify_smtp_host = 127.0.0.1
notify_smtp_port = 25
hosts_directory =
allow = 127.0.0.1
allow = 192.168.1.191


osiris-4.2.3-release: q
[vagrant@itg-services tmp]$ 


Configure management console to scan itself
===========================================
[vagrant@itg-services tmp]$ osiris
Osiris Shell Interface - version 4.2.3-release
 >>> authenticating to (127.0.0.1)

User: admin
Password: 

connected to management console, code version (4.2.3-release).
hello.

osiris-4.2.3-release: new-host

[ new host ]

  > name this host []:  local
  > hostname/IP address []: 127.0.0.1
  > description []: agent installed on management console
  > agent port [2265]: 
  > enable log files for this host? (yes/no) [no]: no

Scan Databases:

    => keep archives of scan databases?  Enabling this option means that the
       database generated with each scan is saved, even if there are no changes
       detected.  Because of disk space, this option is not recommended
       unless your security policy requires it. (yes/no) [no]: no

    => auto-accept changes?  Enabling this option means that detected
       changes are reported only once, and the baseline database is
       automatically set when changes are detected. (yes/no) [yes]: yes

    => purge database store?  Enabling this option means that none
       of the scan databases are saved.  That is, whenever the baseline 
       database is set, the previous one is deleted. (yes/no): [yes]: yes

Notifications:

    => enable email notification for this host? (yes/no) [no]: no
    => send notification on scheduled scans failures? (yes/no) [no]: no
    => send scan notification, even when no changes detected  (yes/no) [no]: no
    => send notification when agent has lost session key  (yes/no) [no]: no
    => notification email (default uses mhost address) []: 

Scheduling:

  > configure scan scheduling information? (yes/no) [no]: yes

    [ scheduling information for local ]

    Scheduling information consists of a start time and a frequency value.
    The frequency is a specified number of minutes between each scan, starting
    from the start time.  The default is the current time.  Specify the start
    time in the following format: mm/dd/yyyy HH:MM

    enter the start date and time 
    using 'mm/dd/yyyy HH:MM' format: [Tue Apr 16 12:17:07 2024] 04/16/2024 04:00
    does this look correct ==> (Tue Apr 16 04:00:00 2024) ? (y/n) y
    enter scan frequency in minutes: [1440] 

  > enable this host? (yes/no) [yes]: yes

host                  => local
hostname/IP address   => 127.0.0.1
description           => agent installed on management console
agent port            => 2265
host type             => generic
log enabled           => no
archive scans         => no
auto accept           => yes
purge databases       => yes
notifications enabled => no
notifications always  => no
notify on rekey       => no
notify on scan fail   => no
notify email          => (management config)
scans starting on     => Tue Apr 16 04:00:00 2024
scan frequency        => daily (every 1440 minutes).
enabled               => yes

Is this correct (y/n)? y
 >>> new host (local) has been created.
Initialize this host? (yes/no): yes

Initializing a host will push over a configuration, start
a scan, and set the created database to be the
trusted database.

Are you sure you want to initialize this host (yes/no): yes

OS Name: Linux
OS Version: 3.10.0-1160.114.2.e

use the default configuration for this OS? (yes/no): yes
 >>> configuration (default.linux) has been pushed.
 >>> scanning process was started on host: local
osiris-4.2.3-release: enable local
 >>> host local is now enabled.
osiris-4.2.3-release: hosts

  [ name ]             [ description ]                 [ enabled ]    

  local                agent installed on management       yes

total: 1

osiris-4.2.3-release: host local
local is alive.
osiris-4.2.3-release[local]: status

[ current status of host: local ]

     current time: Tue Apr 16 12:22:42 2024
         up since: Tue Apr 16 12:03:04 2024

 last config push: Tue Apr 16 12:21:18 2024
 configuration id: c8ce9c09

     agent status: idle.
    config status: current config is valid.
   osiris version: 4.2.3-release
               OS: Linux 3.10.0-1160.114.2.e

osiris-4.2.3-release[local]: status

[ current status of host: local ]

     current time: Tue Apr 16 12:23:11 2024
         up since: Tue Apr 16 12:03:04 2024

 last config push: Tue Apr 16 12:21:18 2024
 configuration id: c8ce9c09

     agent status: idle.
    config status: current config is valid.
   osiris version: 4.2.3-release
               OS: Linux 3.10.0-1160.114.2.e

osiris-4.2.3-release[local]: details

[ host details for: (local) ]

  enabled          : yes
  hostname/IP      : 127.0.0.1
  configs          : 0
  databases        : 1
  host type        : generic
  log files        : no
  archive scans    : no
  auto accept      : yes
  purge databases  : yes
  notify enabled   : no
  notify always    : no
  notify on rekey  : no
  notify scan fail : no
  notify email     : (management config)
  scans start      : Tue Apr 16 04:00:00 2024
  scan period      : every 1440 minutes
  base DB          : 1
  agent port       : 2265
  description      : agent installed on management console

osiris-4.2.3-release[local]: scan
 >>> scanning process was started on host: local
osiris-4.2.3-release[local]: status

[ current status of host: local ]

     current time: Tue Apr 16 12:24:30 2024
         up since: Tue Apr 16 12:03:04 2024

 last config push: Tue Apr 16 12:24:23 2024
 configuration id: c8ce9c09

     agent status: idle.
    config status: current config is valid.
   osiris version: 4.2.3-release
               OS: Linux 3.10.0-1160.114.2.e

osiris-4.2.3-release[local]: 

