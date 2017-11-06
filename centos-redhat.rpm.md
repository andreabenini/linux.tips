### Adding EPEL to a CentOS machine
```
~# yum search epel
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 *.....
================================== N/S matched: epel ==================================
epel-release.noarch : Extra Packages for Enterprise Linux repository configuration

  Name and summary matches only, use "search all" for everything.

~# yum install epel-release
Loaded plugins: fastestmirror
base                                                                                                                                                        | 3.6 kB  00:00:00     
extras                                                                                                                                                      | 3.4 kB  00:00:00     
updates                                                                                                                                                     | 3.4 kB  00:00:00     
(1/2): extras/7/x86_64/primary_db                                                                                                                           | 112 kB  00:00:00     
(2/2): updates/7/x86_64/primary_db                                                                                                                          | 2.9 MB  00:00:04     
Loading mirror speeds from cached hostfile
 *.....
Resolving Dependencies
--> Running transaction check
---> Package epel-release.noarch 0:7-9 will be installed
--> Finished Dependency Resolution

Dependencies Resolved
===================================================================================================================================================================================
 Package                                         Arch                                      Version                                 Repository                                 Size
===================================================================================================================================================================================
Installing:
 epel-release                                    noarch                                    7-9                                     extras                                     14 k

Transaction Summary
===================================================================================================================================================================================
Install  1 Package

Total download size: 14 k
Installed size: 24 k
Is this ok [y/d/N]: y
Downloading packages:
epel-release-7-9.noarch.rpm                                                                                                                                 |  14 kB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : epel-release-7-9.noarch                                                                                                                                         1/1 
  Verifying  : epel-release-7-9.noarch                                                                                                                                         1/1 

Installed:
  epel-release.noarch 0:7-9                                                                                                                                                        

Complete!

```


### /etc/issue and IP address on boot (CentOS+SystemD)
To add machine's current IP address on */etc/issue* it's not necessary to create a script or add a service to systemd. You just need to edit /etc/issue file and add something like
```shell
Current IP Address \4{ens32}
```
Where **ens32** is the network interface name to wait for (ifconfig to query), a more generic `\4` listen to __all__ interfaces so it's quite generic
