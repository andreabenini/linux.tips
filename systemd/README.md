# Cheat Sheet (preview page above)
https://rawgit.com/andreabenini/linux.tips/master/systemd/SysVinit%20to%20Systemd%20Cheatsheet.html


## Remove a service
Removing a service from system should be an easy thing but follow these steps:
```
systemctl stop [servicename]
systemctl disable [servicename]
rm /etc/systemd/system/[servicename]
rm /etc/systemd/system/[servicename] symlinks that might be related
systemctl daemon-reload
systemctl reset-failed
```
