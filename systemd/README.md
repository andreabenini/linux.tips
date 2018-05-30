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

## Clear log
The self maintenance method is to vacuum the logs by size or time.
```
# Retain only the past two days:
journalctl --vacuum-time=2d

# Retain only the past 500 MB:
journalctl --vacuum-size=500M
```
