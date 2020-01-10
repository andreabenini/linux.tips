# Cheat Sheet (preview page above)
http://htmlpreview.github.io/?https://github.com/andreabenini/linux.tips/master/systemd/SysVinit%20to%20Systemd%20Cheatsheet.html
https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units


## Basic unit management
The basic object that `systemd` manages and acts upon is a _"unit"_.
Units can be of many types, but the most common type is a _"service"_ (indicated by a unit file ending in `.service`).
To manage services on a `systemd` enabled server, our main tool is the `systemctl` command.  
All of the normal init system commands have equivalent actions with the `systemctl` command.
#### Start/Stop/Restart/Reload
I can start a service by typing
```
sudo systemctl start nginx
```
To stop it:
```
sudo systemctl stop nginx
```
The same goes for restarting:
```
sudo systemctl restart nginx.service
```
To attempt to reload a service without interrupting normal functionality, I can type (where service supports it):
```
sudo systemctl reload nginx.service
```


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

## Live log
See current log agent on stdout
```
journalctl -f
```

## Detect if service is running (from script or whatever)
```
systemctl is-active sshd && echo "ON" || echo "OFF"
```

## Reduce number of auto VTs on a system
/etc/systemd/logind.conf
```
NAutoVTs=1
# Default is 6, adjust it to whatever number you'd like (1 as example)
```
