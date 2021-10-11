# Disable IPv6 on OpenWRT
```sh
# UCI settings
uci set 'network.lan.ipv6=off'
uci set 'network.wan.ipv6=off'
uci set 'dhcp.lan.dhcpv6=disabled'
/etc/init.d/odhcpd disable

# Commit changes
uci commit
```
### Alternative on specific interfaces
**eth0** is the ethernet interface for this example, change it accordingly
```sh
# permanent solution, edif file [/etc/sysctl.conf]
net.ipv6.conf.eth0.disable_ipv6 = 1
# net.ipv6.conf.all.disable_ipv6=1
# net.ipv6.conf.default.disable_ipv6 = 1

# temporary solution, useful for tests and valid until reboot
echo 1 > /proc/sys/net/ipv6/conf/eth0/disable_ipv6
# temporary solution, sysctl way. All interfaces, default one or yours (example: eth0)
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6 = 1
```

