# Set static IP on CentoOS/RHEL machine
in `/etc/sysconfig/network-scripts/ifcfg-*` change it accordingly (and remove `BOOTPROTO="dhcp"` as well)
```
NM_CONTROLLED="no"
BOOTPROTO="static"
IPADDR="172.25.4.66"
NETMASK="255.255.255.0"
GATEWAY="172.25.4.254"
```

# NetworkManager
Pretty useless in a server machine, old "network" service is fine enough. you may barely disable it if you don't need it
```
systemctl disable NetworkManager
systemctl disable NetworkManager-wait-online.service
```
same goes for `firewalld` if you're using iptables on it
