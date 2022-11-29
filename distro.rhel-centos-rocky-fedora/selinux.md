# HowTo disable selinux

Check if SELinux extensions are enabled, if you get something like the output below they're enabled:
```
[root@server ~]# sestatus 
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Max kernel policy version:      31
```

Edit  `/etc/selinux/config`
```
# Change $SELINUX to:
SELINUX=disabled
```
Now reboot or reload, then check it again, it should be:
```
[root@server ~]# sestatus 
SELinux status:                 disabled
```
