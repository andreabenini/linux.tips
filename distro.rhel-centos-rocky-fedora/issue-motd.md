### /etc/issue and IP address on boot (CentOS+SystemD)
To add machine's current IP address on */etc/issue* it's not necessary to create a script or add a service to systemd. You just need to edit /etc/issue file and add something like
```shell
Current IP Address \4{ens160}
```
Where **ens160** is the network interface name to wait for (`ifconfig`|`ip link` to query), a more generic `\4` listen to __all__ interfaces so it's quite generic
